import 'package:flutter/material.dart';
import 'package:primeiro_projeto_alura/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    const Task(
      text: 'Study Flutter',
      image: 'assets/images/flutter_mascot.png',
      difficulty: 3,
    ),
    const Task(
      text: 'Study React',
      image: 'assets/images/react.png',
      difficulty: 3,
    ),
    const Task(
      text: 'Study JavaScript',
      image: 'assets/images/javascript.png',
      difficulty: 5,
    ),
    const Task(
      text: 'Read a book',
      image: 'assets/images/book.jpg',
      difficulty: 0,
    ),
    const Task(
      text: 'Play Games',
      image: 'assets/images/gaming.png',
      difficulty: 1,
    ),
  ];

  void newTask(String taskName, String image, int difficulty){
    taskList.add(Task(text: taskName, image: image, difficulty: difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
