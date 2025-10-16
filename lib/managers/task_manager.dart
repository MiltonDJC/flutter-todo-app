import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/utils/task_in_list.dart';

class TaskManager {
  TaskManager();

  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    (!taskInList(title, tasks)) ? _tasks.add(Task(title)) : null;
  }

  void deleteTask(String title) {
    taskInList(title, tasks)
        ? _tasks.removeWhere((task) => task.title == title)
        : null;
  }

  void toggleTask(Task task) => task.toggleComplete();
}
