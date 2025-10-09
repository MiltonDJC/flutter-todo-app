import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onChanged,
  });

  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;

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
