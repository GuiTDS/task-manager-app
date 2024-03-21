import 'package:flutter/material.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskCardCategory extends StatelessWidget {
  final Category category;

  const TaskCardCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    String title;
    Color? color;
    switch (category) {
      case Category.work:
        color = Colors.blueGrey;
        title = 'Work';
      case Category.personal:
        color = Colors.yellow;
        title = 'Personal';
      case Category.education:
        color = Colors.deepPurple;
        title = 'Education';
      case Category.health:
        color = Colors.lightGreen;
        title = 'Health';
      case Category.finantial:
        color = Colors.amber;
        title = 'Finantial';
      case Category.house:
        color = Colors.brown;
        title = 'House';
      case Category.travel:
        color = Colors.teal;
        title = 'Travel';
      case Category.others:
        color = Colors.red;
        title = 'Others';
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 1,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Text(title),
    );
  }
}
