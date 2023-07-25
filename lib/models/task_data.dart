import 'package:flutter/foundation.dart';
import 'package:toodley/models/task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Buy Milk"),
    Task(name: "Buy Bread"),
    Task(name: "Buy Eggs"),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
