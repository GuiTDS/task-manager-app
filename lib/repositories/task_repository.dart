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

  save(TaskModel task, TaskModel? oldTask) {
    bool sucess = true;
    if (oldTask == null) {
      _todoList.add(task);
    } else {
      if (task.title != oldTask.title ||
          task.category != oldTask.category ||
          task.date != oldTask.date ||
          task.urgency != oldTask.urgency) {
        print('TASKS DIFERENTES');
        if (oldTask.status == Status.toDo) {
          _todoList.remove(oldTask);
          _todoList.add(task);
        } else if (oldTask.status == Status.inReview) {
          _inReviewList.remove(oldTask);
          _inReviewList.add(task);
        } else {
          _todoList.remove(oldTask);
          _todoList.add(task);
        }
      } else {
        sucess = false;
      }
    }

    notifyListeners();
    return sucess;
  }

  movoToReview(TaskModel task) {
    if (task.status != Status.inReview) {
      task.status = Status.inReview;
      _todoList.remove(task);
      _inReviewList.add(task);
    } else {
      task.status = Status.toDo;
      _inReviewList.remove(task);
      _todoList.add(task);
    }
    notifyListeners();
  }

  completeTask(TaskModel task) {
    if (task.status != Status.completed) {
      if (task.status == Status.toDo) {
        _todoList.remove(task);
      } else {
        _inReviewList.remove(task);
      }
      task.status = Status.completed;
      _completedList.add(task);
    } else {
      task.status = Status.toDo;
      _completedList.remove(task);
      _todoList.add(task);
    }

    notifyListeners();
  }

  deleteTask(TaskModel task) {
    if (task.status == Status.toDo) {
      _todoList.remove(task);
    } else if (task.status == Status.inReview) {
      _inReviewList.remove(task);
    } else {
      _completedList.remove(task);
    }
    notifyListeners();
  }
}
