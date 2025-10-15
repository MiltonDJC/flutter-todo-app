import 'package:flutter/material.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';
import 'package:flutter_todo_app/screens/task_detail_screen.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskManager = TaskManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App')),
      body: ListView.builder(
        itemCount: taskManager.tasks.length,
        itemBuilder: (context, index) {
          final task = taskManager.tasks[index];
          return TaskTile(
            title: task.title,
            isCompleted: task.isCompleted,
            onChanged: (_) {
              setState(() {
                taskManager.toggleTask(task);
              });
            },
            onPressed: () {
              setState(() {
                taskManager.deleteTask(task.title);
              });
            },
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(task: task),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newTaskTitle = '';
              return AlertDialog(
                title: const Text('Nueva tarea'),
                content: TextField(
                  key: const Key('taskTextField'),
                  autofocus: true,
                  onChanged: (value) {
                    newTaskTitle =
                        value.substring(0, 1).toUpperCase() +
                        value.substring(1);
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (newTaskTitle.trim().isNotEmpty) {
                        setState(() {
                          taskManager.addTask(newTaskTitle);
                        });
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Escriba el nombre de la tarea',
                        );
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Agregar'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
