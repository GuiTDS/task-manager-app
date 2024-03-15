import 'package:flutter/material.dart';

enum Urgency { low, medium, high }

class TaskCardUrgency extends StatelessWidget {
  final Urgency urgency;
  const TaskCardUrgency({super.key, required this.urgency});
  @override
  Widget build(BuildContext context) {
    Color? color;
    String title;
    switch (urgency) {
      case Urgency.high:
        color = Colors.red[200];
        title = 'High';
      case Urgency.medium:
        color = Colors.yellow;
        title = 'Medium';
      case Urgency.low:
        color = Colors.blue[200];
        title = 'Low';
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
