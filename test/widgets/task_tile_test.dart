import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/providers/dark_mode_provider.dart';
import 'package:flutter_todo_app/screens/home_screen.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';

void main() {
  group('TaskTile Widget', () {
    late Task task;
    late HomeScreen homeScreen;
    late TaskManager taskManager;
    late DarkModeProvider darkModeProvider;

    setUp(() {
      task = Task('Learn Flutter Test');
      taskManager = TaskManager();
      darkModeProvider = DarkModeProvider();
      homeScreen = const HomeScreen();
    });

    testWidgets('Complete flow: add, complete, and delete a task', (
      WidgetTester tester,
    ) async {
      /* ============ Add task flow ============ */
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => taskManager),
            ChangeNotifierProvider(create: (_) => darkModeProvider),
          ],
          child: MaterialApp(home: homeScreen),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));

      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('taskTextField')),
        'Learn Flutter Test',
      );

      await tester.tap(find.text('Agregar'));

      await tester.pumpAndSettle();

      expect(find.text('Learn Flutter Test'), findsOneWidget);

      /* ============ Display task on the screen flow ============ */

      await tester.tap(find.byType(Checkbox));

      await tester.pumpAndSettle();

      expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);
      expect(
        tester.widget<Text>(find.text('Learn Flutter Test')).style?.decoration,
        TextDecoration.lineThrough,
      );

      /* ============ Delete task flow ============ */

      await tester.tap(find.byKey(const Key('deleteButton')));

      await tester.pumpAndSettle();

      expect(find.text('Learn Flutter Test'), findsNothing);
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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
