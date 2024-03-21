import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/components/task_card/task_card.dart';
import 'package:task_management_app/components/task_filter_button.dart';
import 'package:task_management_app/pages/task_form_page.dart';
import 'package:task_management_app/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int activeButtonIndex = 0; // Estado para rastrear o botão ativo
  late TaskRepository taskRepository;

  void setActiveButtonIndex(int index) {
    setState(() {
      activeButtonIndex = index;
    });
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
          'Task List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskFormPage(),
              ));
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(0),
                  title: 'To Do',
                  isActive: activeButtonIndex == 0,
                ),
                const SizedBox(
                  width: 10,
                ),
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(1),
                  title: 'In Review',
                  isActive: activeButtonIndex == 1,
                ),
                const SizedBox(
                  width: 10,
                ),
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(2),
                  title: 'Completed',
                  isActive: activeButtonIndex == 2,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: taskRepository.list.isEmpty
                ? const Center(
                    child: Text('Nenhuma Tarefa Cadastrada'),
                  )
                : ListView.separated(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 75),
                    itemBuilder: (context, index) => TaskCard(
                        title: taskRepository.list[index].title,
                        date: taskRepository.list[index].dateTime,
                        urgency: taskRepository.list[index].urgency,
                        category: taskRepository.list[index].category),
                    itemCount: taskRepository.list.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
