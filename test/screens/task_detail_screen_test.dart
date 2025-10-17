import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/screens/home_screen.dart';
import 'package:flutter_todo_app/screens/task_detail_screen.dart';
import 'package:flutter_todo_app/widgets/task_tile.dart';

void main() {
  group('Task Detail Screen', () {
    late Task task;
    late Task completedTask;
    late TaskManager taskManager;
    late HomeScreen homeScreen;

    setUp(() {
      task = Task('Learn Flutter');
      completedTask = Task('Learn Flutter Test', isCompleted: true);
      taskManager = TaskManager();
      homeScreen = HomeScreen(
        onToggleTheme: () {},
        isDarkMode: false,
        taskManager: taskManager,
      );
      taskManager.addTask(task.title);
      taskManager.addTask(completedTask.title);
    });

    testWidgets(
      "Given the user is on the Home Screen, when the user taps on a TaskTile widget, then the application navigates to the detail screen and displays the task's title.",
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: homeScreen));
        await tester.tap(find.byType(TaskTile).first);
        await tester.pumpAndSettle();
        expect(find.text(task.title), findsOneWidget);
      },
    );

    testWidgets(
      'Given the user is on the Task Detail Screen, when the user taps on the back button (identified by the navigatorBackButton key), then the application returns to the previous screen and the HomeScreen is displayed.',
      (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: homeScreen));
        await tester.tap(find.byType(TaskTile).first);
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
        expect(find.byType(HomeScreen), findsOneWidget);
      },
    );

    testWidgets(
      "Given the TaskDetailScreen is loaded with an incomplete task, when the screen is rendered, then it should display the text 'Tarea Incompleta' (or 'Incomplete Task') and the corresponding cancel icon (Icons.cancel)",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(home: TaskDetailScreen(task: task)),
        );
        expect(find.text('Tarea Incompleta'), findsOneWidget);
        expect(find.byIcon(Icons.cancel), findsOneWidget);
      },
    );

    testWidgets(
      "Given the TaskDetailScreen is loaded with an complete task, when the screen is rendered, then it should display the text 'Tarea Completada' (or 'Completed Task') and the corresponding check icon (Icons.check)",
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(home: TaskDetailScreen(task: completedTask)),
        );
        expect(find.text('Tarea Completada'), findsOneWidget);
        expect(find.byIcon(Icons.check), findsOneWidget);
      },
    );
  });
}
