import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todo_list_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(text: 'test1', tag: 'work'),
    Task(text: 'test2', tag: 'work'),
    Task(text: 'test3', tag: 'work'),
  ];

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newText, String newTag) {
    _tasks.add(Task(text: newText, tag: newTag));
    notifyListeners();
  }

  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
