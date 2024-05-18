import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade900,
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: ListView(
          children: const [
            Task(
              text: 'Study Flutter',
              image:
                  'assets/images/flutter_mascot.png',
              difficulty: 3,
            ),
            Task(
              text: 'Study React',
              image:
                  'assets/images/react.png',
              difficulty: 3,
            ),
            Task(
              text: 'Study JavaScript',
              image:
                  'assets/images/javascript.png',
              difficulty: 5,
            ),
            Task(
              text: 'Read a book',
              image:'assets/images/book.jpg',
              difficulty: 0,
            ),
            Task(
              text: 'Play Games',
              image: 'assets/images/gaming.png',
              difficulty: 1,
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
