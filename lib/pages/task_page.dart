import 'package:flutter/material.dart';
import 'package:task_management_app/components/task_filter_button.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TaskFilterButton(),
                  SizedBox(width: 10,),
                  TaskFilterButton(),
                  SizedBox(width: 10,),
                  TaskFilterButton(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => const Text('item'),
                itemCount: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
