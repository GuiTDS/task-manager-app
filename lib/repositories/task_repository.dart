import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskRepository extends ChangeNotifier {
  final List<TaskModel> _todoList = [];
  final List<TaskModel> _inReviewList = [];
  final List<TaskModel> _completedList = [];

  UnmodifiableListView<TaskModel> get todoList =>
      UnmodifiableListView(_todoList);

  UnmodifiableListView<TaskModel> get inReviewList =>
      UnmodifiableListView(_inReviewList);

  UnmodifiableListView<TaskModel> get completedList =>
      UnmodifiableListView(_completedList);

  startRepository() {
    return todoList;
  }

  save(TaskModel task) {
    _todoList.add(task);
    notifyListeners();
  }

  movoToReview(TaskModel task) {
    _todoList.remove(task);
    _inReviewList.add(task);
    notifyListeners();
  }

  completeTask(TaskModel task) {
    task.status = Status.completed;
    _todoList.remove(task);
    _completedList.add(task);
    notifyListeners();
  }
}
