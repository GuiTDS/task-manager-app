import 'package:flutter/material.dart';

class TaskCardCategory extends StatelessWidget {
  const TaskCardCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 1,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
        color: Colors.red[200],
      ),
      child: const Text('High'),
    );
  }
}
