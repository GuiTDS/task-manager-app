import 'package:flutter/material.dart';

class TaskFilterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isActive;

  const TaskFilterButton({
    Key? key,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: const BorderSide(color: Colors.black)),
          backgroundColor: isActive ? Colors.black : Colors.white,
          padding: const EdgeInsets.only(left: 20, right: 0),
        ),
        child: Row(
          children: [
            Text(
              'Complete ',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.grey,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12),
                  right: Radius.circular(12),
                ),
              ),
              width: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '30',
                    style: TextStyle(
                      color: isActive ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
