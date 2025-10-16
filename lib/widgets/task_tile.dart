import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onChanged,
    required this.onPressed,
    required this.onTap,
  });

  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onPressed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
      onTap: onTap,
    );
  }
}
