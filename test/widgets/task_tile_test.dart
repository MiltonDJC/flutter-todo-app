import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';

void main() {
  group('TaskTile Widget', () {
    late Task task;
    late TaskManager taskManager;

    setUp(() {
      task = Task('Learn Flutter Test');
      taskManager = TaskManager();
    });

    testWidgets(
      "Given a task, when it is marked as completed tapping on checkbox, then the task is state is 'completed'",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TaskTile(
                title: task.title,
                isCompleted: task.isCompleted,
                onChanged: (newBool) {
                  task.isCompleted = newBool!;
                },
                onPressed: () {
                  taskManager.deleteTask(task.title);
                },
              ),
            ),
          ),
        );

        expect(task.isCompleted, isFalse);

        await tester.tap(find.byType(Checkbox));

        expect(task.isCompleted, isTrue);
      },
    );

    testWidgets(
      'Given a task, when it is marked as completed, then the text style is TextDecoration.lineThrough.',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TaskTile(
                title: task.title,
                isCompleted: task.isCompleted,
                onChanged: (newBool) {
                  task.isCompleted = newBool!;
                },
                onPressed: () {
                  taskManager.deleteTask(task.title);
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(Checkbox));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TaskTile(
                title: task.title,
                isCompleted: task.isCompleted,
                onChanged: (_) {},
                onPressed: () {
                  taskManager.deleteTask(task.title);
                },
              ),
            ),
          ),
        );

        final textWidget = tester.widget<Text>(find.text('Learn Flutter Test'));

        expect(textWidget.style?.decoration, TextDecoration.lineThrough);
      },
    );
  });
}
