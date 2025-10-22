import 'package:flutter/material.dart';
import 'package:flutter_todo_app/managers/task_manager.dart';
import 'package:flutter_todo_app/providers/dark_mode_provider.dart';
import 'package:flutter_todo_app/screens/home_screen.dart';
import 'package:flutter_todo_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskManager>(create: (_) => TaskManager()),
        ChangeNotifierProvider<DarkModeProvider>(
          create: (_) => DarkModeProvider(),
        ),
      ],
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkModeProvider = context.watch<DarkModeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic ToDo App',
      themeMode: darkModeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeAnimationDuration: const Duration(milliseconds: 200),
      home: const HomeScreen(),
    );
  }
}
