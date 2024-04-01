import 'package:flutter/material.dart';
import 'package:task_management_app/components/task_card/task_card_category.dart';
import 'package:task_management_app/components/task_card/task_card_urgency.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;
  final VoidCallback onPressed;
  const TaskCard({super.key, required this.task, required this.onPressed});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.task.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.black),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      value: 'editar',
                      child: ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Editar'),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'excluir',
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: Text('Excluir'),
                      ),
                    ),
                  ],
                  onSelected: (value) => print(value),
                )
              ],
            ),
            Row(
              children: [
                TaskCardUrgency(urgency: widget.task.urgency),
                const SizedBox(
                  width: 5,
                ),
                TaskCardCategory(category: widget.task.category),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${widget.task.date.day}/${widget.task.date.month < 10 ? '0${widget.task.date.month}' : widget.task.date.month}/${widget.task.date.year}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      if (widget.task.status != Status.completed) {
                        widget.onPressed();
                      }
                    },
                    icon: widget.task.status == Status.completed
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                          )
                        : const Icon(Icons.check)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
