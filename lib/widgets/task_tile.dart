import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decoration: isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(value: isCompleted, onChanged: onChanged),
    );
  }
}
