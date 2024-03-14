import 'package:flutter/material.dart';
import 'package:task_management_app/components/task_card/task_card_category.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

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
            const Row(
              children: [
                TaskCardCategory(),
                SizedBox(
                  width: 5,
                ),
                TaskCardCategory(),
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
