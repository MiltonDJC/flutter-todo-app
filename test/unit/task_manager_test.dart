import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';

void main() {
  group('TaskManager', () {
    late TaskManager taskManager;
    late bool listenerCalled;

    setUp(() {
      taskManager = TaskManager();
      listenerCalled = false;
    });

    test(
      'Given the task manager list, when a task is added, then the task manager list increases by one.',
      () {
        final int tasksLength = taskManager.tasks.length;
        taskManager.addTask('Learn Flutter');
        expect(taskManager.tasks.length, tasksLength + 1);
      },
    );
    test(
      "Given the task manager list, when a task is added, then title of the task is 'Learn Flutter'.",
      () {
        taskManager.addTask('Learn Flutter');
        expect(
          taskManager.tasks[taskManager.tasks.length - 1].title,
          'Learn Flutter',
        );
      },
    );
    test(
      'Given the task manager list, when an empty task is try to be added, then the task should not be available to be added.',
      () {
        final tasksLength = taskManager.tasks.length;
        taskManager.addTask('');
        expect(taskManager.tasks.length, equals(tasksLength));
      },
    );
    test(
      'Given the task manager list, when a task with spaces is try to be added, then the task should not be available to be added.',
      () {
        final tasksLength = taskManager.tasks.length;
        taskManager.addTask('   ');
        expect(taskManager.tasks.length, equals(tasksLength));
      },
    );
    test(
      'Given the task manager list with only one task, when wants to remove the task, then the task manager list will decrease.',
      () {
        taskManager.addTask('Learn Dart Test');
        final tasksLength = taskManager.tasks.length;
        taskManager.deleteTask('Learn Dart Test');
        expect(taskManager.tasks.length, lessThan(tasksLength));
      },
    );
    test(
      'Given the task manager list with only one task, when wants to remove the task, then the task manager list will be empty.',
      () {
        taskManager.addTask('Learn Dart Test');
        taskManager.deleteTask('Learn Dart Test');
        expect(taskManager.tasks, isEmpty);
      },
    );
    test(
      'Given a manager with one incomplete task, when toggleTask() is called, then task becomes completed',
      () {
        taskManager.addTask('Learn Flutter');
        taskManager.toggleTask(taskManager.tasks[0]);
        expect(taskManager.tasks[0].isCompleted, isTrue);
      },
    );

    test(
      'Given a manager with one completed task, when toggleTask() is called, then task becomes incomplete',
      () {
        taskManager.addTask('Learn Flutter');
        taskManager.tasks[0].isCompleted = true;
        taskManager.toggleTask(taskManager.tasks[0]);
        expect(taskManager.tasks[0].isCompleted, isFalse);
      },
    );

    test(
      'Given a TaskManager with listeners, when a task is added, then notifyListeners() should be called and listeners are notified',
      () {
        taskManager.addListener(() {
          listenerCalled = true;
        });

        taskManager.addTask('Learn Provider');

        expect(listenerCalled, isTrue);
      },
    );
  });
}
