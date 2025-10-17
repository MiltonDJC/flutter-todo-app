import 'package:flutter/material.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';
import 'package:flutter_todo_app/screens/task_detail_screen.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
    required this.taskManager,
  });

  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  final TaskManager taskManager;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo App'),
          actions: [
            // Change between theme modes.
            Switch(
              value: widget.isDarkMode,
              onChanged: (_) => widget.onToggleTheme(),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: widget.taskManager.tasks.length,
          itemBuilder: (context, index) {
            final task = widget.taskManager.tasks[index];
            return TaskTile(
              title: task.title,
              isCompleted: task.isCompleted,
              onChanged: (_) =>
                  setState(() => widget.taskManager.toggleTask(task)),
              onPressed: () =>
                  setState(() => widget.taskManager.deleteTask(task.title)),
              // Navigate to task detail.
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(task: task),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              String newTaskTitle = '';
              return AlertDialog(
                title: const Text('Nueva tarea'),
                content: TextField(
                  key: const Key('taskTextField'),
                  autofocus: true,
                  onChanged: (value) => newTaskTitle = value,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (newTaskTitle.trim().isNotEmpty) {
                        String capitalizedText =
                            newTaskTitle.substring(0, 1).toUpperCase() +
                            newTaskTitle.substring(1);
                        setState(
                          () => widget.taskManager.addTask(capitalizedText),
                        );
                        Navigator.pop(context);
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Escriba el nombre de la tarea',
                        );
                      }
                    },
                    child: const Text('Agregar'),
                  ),
                ],
              );
            },
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
