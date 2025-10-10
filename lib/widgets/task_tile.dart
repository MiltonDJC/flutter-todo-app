import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onChanged,
    required this.onPressed,
  });

  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          decoration: isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(value: isCompleted, onChanged: onChanged),
          TextButton.icon(
            key: const Key('deleteButton'),
            onPressed: onPressed,
            label: const Icon(Icons.delete_forever, size: 24),
          ),
        ],
      ),
    );
  }
}
