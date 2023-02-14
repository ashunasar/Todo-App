import 'package:animated_emoji/animated_emoji.dart';
import 'package:animated_emoji/emojis.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/modules/task/view/add_task.view.dart';
import 'package:todoapp/shared/models/task.model.dart';

import '../../../shared/widgets/task_dialog.widget.dart';

class HomeProvider extends ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(
        emojiData: AnimatedEmojis.angry,
        title: 'Some random title',
        description:
            'Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur pLorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur',
        date: DateTime.now())
  ];

  void showTaskDialog(BuildContext context, TaskModel task) async {
    await showDialog(
        context: context,
        builder: (context) {
          return TaskDialog(task: task);
        });
  }

  void addTask(TaskModel t) {
    tasks.add(t);
    notifyListeners();
  }

  void removeTask(TaskModel t) {
    tasks.remove(t);
    notifyListeners();
  }

  void updateTask(TaskModel t, int index) {
    tasks[index] = t;
    notifyListeners();
  }

  void editTask(BuildContext context, TaskModel t) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskView(task: t)));
  }
}
