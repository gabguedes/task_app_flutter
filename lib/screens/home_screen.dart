import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/data/task_inherited.dart';
import 'package:primeiro_projeto_alura/screens/form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tasks'),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    value: (TaskInherited.of(context).userLevel)/1000,
                    color: Colors.white,
                    backgroundColor: Colors.black38,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'User Level : ${(TaskInherited.of(context).userLevel)/10}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(onPressed: () {
            setState(() {
              print(TaskInherited.of(context).userLevel);
            });
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Level',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 70),
        children: TaskInherited
            .of(context)
            .taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (newContext) => FormScreen(taskContext: context,),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
