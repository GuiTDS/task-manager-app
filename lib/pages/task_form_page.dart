import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/repositories/task_repository.dart';

class TaskFormPage extends StatefulWidget {
  final TaskModel? oldTask;
  const TaskFormPage({Key? key, this.oldTask}) : super(key: key);

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.oldTask == null) {
      selectedCategory = null;
      selectedUrgency = null;
    } else {
      selectedCategory = widget.oldTask?.category;
      selectedUrgency = widget.oldTask?.urgency;
      _titleController = TextEditingController(text: widget.oldTask?.title);
      _dateController =
          TextEditingController(text: widget.oldTask?.date.toString());
    }
  }

  late TaskRepository taskRepository;
  Urgency? selectedUrgency;
  Category? selectedCategory;
  DateTime? _selectedDate;
  final _dateFormat = DateFormat('dd/MM/yyyy');
  TextEditingController _titleController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
    print(_dateController.text);
  }

  saveTask() {
    TaskModel task = TaskModel(
        title: _titleController.text,
        urgency: selectedUrgency!,
        category: selectedCategory!,
        date: _dateController.text,
        status: Status.toDo);
    bool isSaved = taskRepository.save(task, widget.oldTask);
    if (isSaved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text(widget.oldTask == null ? 'Task Created' : 'Task Updated')),
      );
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
        title: Text(
          widget.oldTask == null ? 'Create new task' : 'Update Task',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
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
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Please fill the title';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null) {
                      return 'Please select urgency';
                    }
                    return null;
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
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
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
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please select a valid date';
                    }
                    return null;
                  },
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
                      if (_formKey.currentState!.validate()) {
                        saveTask();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/taskPage', (route) => false);
                      }
                    },
                    icon: const Icon(Icons.add, color: Colors.black),
                    label: Text(
                      widget.oldTask == null ? 'Add Task' : 'Save',
                      style: const TextStyle(
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
