import 'package:flutter/material.dart';
import 'package:task_management_app/components/task_card/task_card.dart';
import 'package:task_management_app/components/task_card/task_card_category.dart';
import 'package:task_management_app/components/task_card/task_card_urgency.dart';
import 'package:task_management_app/components/task_filter_button.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int activeButtonIndex = 0; // Estado para rastrear o botão ativo

  void setActiveButtonIndex(int index) {
    setState(() {
      activeButtonIndex = index;
    });
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
        onPressed: () {},
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
            padding: EdgeInsets.only(left: 18),
            child: Row(
              children: [
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(0),
                  isActive: activeButtonIndex == 0,
                ),
                const SizedBox(
                  width: 10,
                ),
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(1),
                  isActive: activeButtonIndex == 1,
                ),
                const SizedBox(
                  width: 10,
                ),
                TaskFilterButton(
                  onPressed: () => setActiveButtonIndex(2),
                  isActive: activeButtonIndex == 2,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 75),
              itemBuilder: (context, index) => const TaskCard(
                  urgency: Urgency.high, category: Category.finantial),
              itemCount: 6,
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
