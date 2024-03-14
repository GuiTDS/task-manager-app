import 'package:flutter/material.dart';

enum Urgency { low, medium, high }

class TaskCardCategory extends StatelessWidget {
  final Urgency urgency;

  const TaskCardCategory({super.key, required this.urgency});

  @override
  Widget build(BuildContext context) {
    String title;
    Color? color;
    switch (urgency) {
      case Urgency.low:
        color = Colors.green[300];
        title = 'Low';
      case Urgency.medium:
        color = Colors.yellow;
        title = 'Medium';
      case Urgency.high:
        color = Colors.red[200];
        title = 'High';
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
