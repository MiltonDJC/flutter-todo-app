import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';

void main() {
  group('TaskTile Widget', () {
    late Task task;

    setUp(() {
      task = Task('Learn Flutter Test');
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
              ),
            ),
          ),
        );

        expect(task.isCompleted, isFalse);

        await tester.tap(find.byType(Checkbox));
        await tester.pump();

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
              ),
            ),
          ),
        );

        await tester.tap(find.byType(Checkbox));
        await tester.pump();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TaskTile(
                title: task.title,
                isCompleted: task.isCompleted,
                onChanged: (_) {},
              ),
            ),
          ),
        );
        await tester.pump();

        final textWidget = tester.widget<Text>(find.text('Learn Flutter Test'));

        expect(textWidget.style?.decoration, TextDecoration.lineThrough);
      },
    );
  });
}
