import 'package:flutter/material.dart';
import 'package:todoapp/modules/task/view/add_task.view.dart';
import 'package:todoapp/shared/models/task.model.dart';

import '../../../firebase/firestore_db.dart';
import '../../../shared/widgets/task_dialog.widget.dart';

class HomeProvider extends ChangeNotifier {
  List<TaskModel>? tasks;
  void showTaskDialog(BuildContext context, TaskModel task) async {
    await showDialog(
        context: context,
        builder: (context) {
          return TaskDialog(task: task);
        });
  }

  void addTask(TaskModel t) {
    tasks?.add(t);
    notifyListeners();
  }

  void removeTask(TaskModel t) {
    tasks?.remove(t);
    notifyListeners();
  }

  void updateTask(TaskModel t, int index) {
    tasks?[index] = t;
    notifyListeners();
  }

  void editTask(BuildContext context, TaskModel t) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTaskView(task: t)));
  }

  Future<void> getTasks() async {
    tasks = await FirestoreDb.getTasks();
    notifyListeners();
  }
}
