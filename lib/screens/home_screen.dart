import 'package:flutter/material.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';
import 'package:flutter_todo_app/providers/dark_mode_provider.dart';
import 'package:flutter_todo_app/screens/task_detail_screen.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = context.watch<DarkModeProvider>();
    final taskManager = context.watch<TaskManager>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo App'),
          actions: [
            // Change between theme modes.
            Switch(
              value: darkModeProvider.isDarkMode,
              onChanged: (_) => context.read<DarkModeProvider>().toggleTheme(),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: taskManager.tasks.length,
          itemBuilder: (context, index) {
            final task = taskManager.tasks[index];
            return TaskTile(
              title: task.title,
              isCompleted: task.isCompleted,
              onChanged: (_) => taskManager.toggleTask(task),
              onPressed: () => taskManager.deleteTask(task.title),
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
                        taskManager.addTask(capitalizedText);
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
