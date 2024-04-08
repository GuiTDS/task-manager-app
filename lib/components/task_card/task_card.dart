import 'package:flutter/material.dart';
import 'package:task_management_app/components/task_card/task_card_category.dart';
import 'package:task_management_app/components/task_card/task_card_urgency.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/pages/task_form_page.dart';

class TaskCard extends StatefulWidget {
  final TaskModel task;
  final VoidCallback onPressedComplete;
  final VoidCallback onPressedReview;
  const TaskCard(
      {super.key,
      required this.task,
      required this.onPressedComplete,
      required this.onPressedReview});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final double iconBoxWidth = 30;
  final double iconBoxHeight = 30;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskFormPage(
                oldTask: widget.task,
              ),
            ));
      },
      child: Container(
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
                  SizedBox(
                      height: iconBoxHeight,
                      width: iconBoxWidth,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () => print(''),
                      )),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.task.date,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      widget.task.status == Status.completed
                          ? Container(
                              width: 0,
                            )
                          : SizedBox(
                              height: iconBoxHeight,
                              width: iconBoxWidth,
                              child: IconButton(
                                onPressed: () {
                                  widget.onPressedReview();
                                },
                                icon: Icon(
                                  Icons.edit_note,
                                  color: widget.task.status == Status.inReview
                                      ? Colors.blue[300]
                                      : Colors.black,
                                ),
                              ),
                            ),
                      SizedBox(
                        height: iconBoxHeight,
                        width: iconBoxWidth,
                        child: IconButton(
                          onPressed: () {
                            widget.onPressedComplete();
                          },
                          icon: widget.task.status == Status.completed
                              ? const Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.check,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
