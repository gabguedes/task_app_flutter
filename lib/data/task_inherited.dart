import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(
      text: 'Study Flutter',
      image: 'assets/images/flutter_mascot.png',
      difficulty: 3,
    ),
    Task(
      text: 'Study React',
      image: 'assets/images/react.png',
      difficulty: 3,
    ),
    Task(
      text: 'Study JavaScript',
      image: 'assets/images/javascript.png',
      difficulty: 5,
    ),
    Task(
      text: 'Read a book',
      image: 'assets/images/book.jpg',
      difficulty: 0,
    ),
    Task(
      text: 'Play Games',
      image: 'assets/images/gaming.png',
      difficulty: 1,
    ),
  ];

  double userLevel = 0;

  void newTask(String taskName, String image, int difficulty){
    taskList.add(Task(text: taskName, image: image, difficulty: difficulty));
  }

  void incrementLevel(int difficulty){
   switch(difficulty){
     case 0:
       break;
     case 1:
       userLevel += 1;
       break;
     case 2:
       userLevel += 2;
       break;
     case 3:
       userLevel += 3;
       break;
     case 4:
       userLevel += 4;
       break;
     case 5:
       userLevel += 5;
       break;
   }
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
