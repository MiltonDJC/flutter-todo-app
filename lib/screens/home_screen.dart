import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/utils/dummy_data.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = List.from(dummyTasks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return TaskTile(
            title: task.title,
            isCompleted: task.isCompleted,
            onChanged: (newBool) {
              setState(() {
                task.toggleComplete();
              });
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
                  autofocus: true,
                  onChanged: (value) {
                    newTaskTitle = value;
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
                          _tasks.add(Task(newTaskTitle));
                        });
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
