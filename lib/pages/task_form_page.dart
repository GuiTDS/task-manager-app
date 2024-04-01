import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/pages/task_page.dart';
import 'package:task_management_app/repositories/task_repository.dart';

class TaskFormPage extends StatefulWidget {
  const TaskFormPage({Key? key}) : super(key: key);

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  late TaskRepository taskRepository;
  Urgency? selectedUrgency;
  Category? selectedCategory;
  DateTime? _selectedDate;
  final _dateFormat = DateFormat('dd/MM/yyyy');
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _dateFormat.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    taskRepository = Provider.of<TaskRepository>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.view_list_rounded,
          size: 30,
        ),
        title: const Text(
          'Create new task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Task title', border: OutlineInputBorder()),
                  onChanged: (value) {
                    _titleController.text = value;
                    print(_titleController.text);
                  },
                  controller: _titleController,
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<Urgency>(
                  decoration: const InputDecoration(
                      hintText: 'Urgency', border: OutlineInputBorder()),
                  value: selectedUrgency,
                  items: Urgency.values
                      .map(
                        (item) => DropdownMenuItem<Urgency>(
                          value: item,
                          child: Text(
                            item.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (Urgency? value) {
                    setState(() {
                      selectedUrgency = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<Category>(
                  decoration: const InputDecoration(
                      hintText: 'Category', border: OutlineInputBorder()),
                  value: selectedCategory,
                  items: Category.values.map((item) {
                    return DropdownMenuItem<Category>(
                      value: item,
                      child: Text(
                        item.name.toString(),
                      ),
                    );
                  }).toList(),
                  onChanged: (Category? value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'dd/MM/yyyy',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30)),
                    ),
                    onPressed: () {
                      List<String> date = _dateController.text.split('/');
                      TaskModel task = TaskModel(
                          title: _titleController.text,
                          urgency: selectedUrgency!,
                          category: selectedCategory!,
                          date: DateTime(int.parse(date[2]),
                              int.parse(date[1]), int.parse(date[0])),
                          status: Status.toDo);
                      taskRepository.save(task);

                       Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TaskPage(),
                          )); 
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Icons.add, color: Colors.black),
                    label: const Text(
                      'Add Task',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
