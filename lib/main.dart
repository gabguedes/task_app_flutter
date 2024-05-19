import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/data/task_inherited.dart';
import 'package:primeiro_projeto_alura/screens/form_screen.dart';
import 'package:primeiro_projeto_alura/screens/home_screen.dart';
// import 'package:primeiro_projeto_alura/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple.shade900,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.deepPurple.shade600,
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: TaskInherited(
        child: const HomeScreen(),
      ),
      // home: ,
    );
  }
}
