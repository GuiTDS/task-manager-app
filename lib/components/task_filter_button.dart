import 'package:flutter/material.dart';

class TaskFilterButton extends StatelessWidget {
  const TaskFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: ElevatedButton(
          onPressed: () => print('clicou'),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.only(left: 20, right: 0)),
          child: Row(
            children: [
              const Text(
                'Complete ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(12), right: Radius.circular(12)),
                ),
                width: 30,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '30',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
