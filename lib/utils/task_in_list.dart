import 'package:flutter_todo_app/models/task.dart';

bool taskInList(String title, List<Task> tasks) {
  for (Task task in tasks) {
    if (task.title == title) return true;
  }
  return false;
}
