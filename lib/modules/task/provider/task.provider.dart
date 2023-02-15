import 'package:animated_emoji/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/modules/home/provider/home.provider.dart';
import 'package:todoapp/shared/models/task.model.dart';
import 'package:todoapp/shared/utils/util_functions.dart';

import '../../../shared/widgets/emoji_picker.widget.dart';

class TaskProvider extends ChangeNotifier {
  DateTime pickedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      pickedDate = picked;
      notifyListeners();
    }
  }

  bool isEdit = false;
  TaskModel? oldTask;
  void initialize(TaskModel? t) {
    if (t != null) {
      pickedDate = t.date;
      titleController.text = t.title;
      descriptionController.text = t.description;
      selectedTaskEmojiMood = AnimatedEmojiData(t.emojiDataId);
      oldTask = t;
      isEdit = true;
    } else {
      selectedTaskEmojiMood = null;
      pickedDate = DateTime.now();
      titleController.clear();
      descriptionController.clear();
      isEdit = false;
      oldTask = null;
    }
  }

  AnimatedEmojiData? selectedTaskEmojiMood;
  Future<void> pickTaskEmojiMood(BuildContext context) async {
    var value = await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return const EmojiPicker();
        },
        context: context);
    if (value != null) {
      selectedTaskEmojiMood = value;
      notifyListeners();
    }
  }

  void addNewTask(BuildContext context) {
    if (selectedTaskEmojiMood == null) {
      UtilFunctions.showToast(message: 'Please pick an emoji for your task');
      return;
    }

    if (titleController.text.isEmpty) {
      UtilFunctions.showToast(message: 'Please enter task title');
      return;
    }
    if (descriptionController.text.isEmpty) {
      UtilFunctions.showToast(message: 'Please enter task description');
      return;
    }
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (isEdit) {
      int index = homeProvider.tasks!.indexOf(oldTask!);
      homeProvider.updateTask(
          TaskModel(
              emojiDataId: selectedTaskEmojiMood!.id,
              title: titleController.text,
              description: descriptionController.text,
              date: pickedDate),
          index);
      UtilFunctions.showToast(message: 'Your task is updated! 🎉');
    } else {
      homeProvider.addTask(TaskModel(
          emojiDataId: selectedTaskEmojiMood!.id,
          title: titleController.text,
          description: descriptionController.text,
          date: pickedDate));
      UtilFunctions.showToast(message: 'Your task is created! 🎉');
    }

    Navigator.pop(context);
  }
}
