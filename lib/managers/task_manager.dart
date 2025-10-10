import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/utils/task_in_list.dart';

class TaskManager {
  TaskManager();

  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    if (!taskInList(title, tasks)) {
      _tasks.add(Task(title));
    }
  }

  void deleteTask(String title) {
    if (taskInList(title, tasks)) {
      _tasks.removeWhere((task) => task.title == title);
    }
  }

  void toggleTask(Task task) {
    task.toggleComplete();
  }
}
