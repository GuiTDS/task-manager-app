import 'package:flutter/material.dart';
import 'package:task_management_app/components/task_card/task_card_category.dart';
import 'package:task_management_app/components/task_card/task_card_urgency.dart';

class TaskCard extends StatelessWidget {
  final Category? category;
  final Urgency urgency;
  const TaskCard({super.key, required this.urgency, this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Task title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () => print('clicked'),
                    icon: const Icon(Icons.more_horiz))
              ],
            ),
            Row(
              children: [
                TaskCardUrgency(urgency: urgency),
                const SizedBox(
                  width: 5,
                ),
                category != null ? TaskCardCategory(category: category!) : const SizedBox(), 
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '14/03/2024',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () => print('clicked'),
                    icon: const Icon(Icons.check)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
