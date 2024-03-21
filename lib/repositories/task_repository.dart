import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskRepository extends ChangeNotifier {
  List<TaskModel> _list = [];
  UnmodifiableListView<TaskModel> get list => UnmodifiableListView(_list);

  startRepository() {
    return _list;
  }

  save(TaskModel task) {
    _list.add(task);
    notifyListeners();
  }
}
