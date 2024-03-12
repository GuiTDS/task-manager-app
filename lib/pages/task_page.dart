import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => print('clicou'),
                  child: const Row(
                    children: [
                      Text('Complete'),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '65',
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => print('clicou'),
                  child: const Row(
                    children: [
                      Text('Complete'),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '65',
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => print('clicou'),
                  child: const Row(
                    children: [
                      Text('Complete'),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '65',
                      ),
                    ],
                  ),
                ),
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
    );
  }
}
