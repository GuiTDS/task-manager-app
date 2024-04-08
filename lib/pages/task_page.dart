import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/components/task_card/task_card.dart';
import 'package:task_management_app/components/task_filter_button.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/pages/task_form_page.dart';
import 'package:task_management_app/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late TaskRepository taskRepository;
  List<TaskModel> todoList = [];
  List<TaskModel> inReviewList = [];
  List<TaskModel> completedList = [];
  List<TaskModel> currList = [];
  int activeButtonIndex = 0;

  @override
  void initState() {
    super.initState();
    taskRepository = Provider.of<TaskRepository>(context, listen: false);
    todoList = taskRepository.todoList;
    inReviewList = taskRepository.inReviewList;
    completedList = taskRepository.completedList;
    currList = todoList;
  }

  setActiveButtonIndex(int index) {
    setState(() {
      activeButtonIndex = index;
      if (activeButtonIndex == 0) {
        currList = todoList;
      } else if (activeButtonIndex == 1) {
        currList = inReviewList;
      } else {
        currList = completedList;
      }
    });
  }

  completeTask(TaskModel task) {
    setState(() {
      taskRepository.completeTask(task);
    });
    final String message = task.status == Status.completed
        ? 'Task Completed'
        : 'Task moved to To Do';
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  reviewTask(TaskModel task) {
    setState(() {
      taskRepository.movoToReview(task);
    });
    final String message = task.status == Status.inReview
        ? 'Task moved for review'
        : 'Task moved to To Do';
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  deleteTask(TaskModel task) {
    setState(() {
      taskRepository.deleteTask(task);
    });
    const String message = 'Task Deleted';
    return ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
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
                  quantity: todoList.length,
                ),
                const SizedBox(
                  width: 10,
                ),
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(1),
                  title: 'In Review',
                  isActive: activeButtonIndex == 1,
                  quantity: inReviewList.length,
                ),
                const SizedBox(
                  width: 10,
                ),
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(2),
                  title: 'Completed',
                  isActive: activeButtonIndex == 2,
                  quantity: completedList.length,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: currList.isEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        'No Tasks Found',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset('assets/images/mascot.png', height: 300),
                    ],
                  )
                : ListView.separated(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 75),
                    itemBuilder: (context, index) => TaskCard(
                      task: currList[index],
                      onPressedComplete: () => completeTask(currList[index]),
                      onPressedReview: () => reviewTask(currList[index]),
                      onPressedDelete: () => deleteTask(currList[index]),
                    ),
                    itemCount: currList.length,
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
