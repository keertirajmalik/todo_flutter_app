import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    if (newTaskTitle != null) {
      _tasks.add(Task(name: newTaskTitle));
    }
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task taskTitle) {
    _tasks.remove(taskTitle);
    notifyListeners();
  }
}
