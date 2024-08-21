import 'dart:ffi';

import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task("Aprender Flutter", "assets/images/img1.png", 3),
    Task("Andar de Bike", "assets/images/img2.jpeg", 2),
    Task("Meditar", "assets/images/img3.jpeg", 5),
    Task("Jogar", "assets/images/img4.jpg", 1),
    Task("Ler", "assets/images/img5.jpg", 4),
  ];

  void addNewTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
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
