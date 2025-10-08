import 'package:flutter_todo_app/models/task.dart';

class TaskManager {
  final List<Task> _tasks = [];

  TaskManager();

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    _tasks.add(Task(title));
  }

  void toggleTask(Task task) {
    task.toggleComplete();
  }
}
