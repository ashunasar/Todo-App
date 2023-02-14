import 'package:animated_emoji/animated_emoji.dart';
import 'package:animated_emoji/emojis.dart';
import 'package:flutter/material.dart';
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
    var result = await showDialog(
        context: context,
        builder: (context) {
          return TaskDialog(task: task);
        });

    if (result == TaskAction.delete) {
      tasks.remove(task);
      notifyListeners();
    }
  }
}
