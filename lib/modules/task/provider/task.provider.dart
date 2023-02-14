import 'package:animated_emoji/emojis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/modules/home/provider/home.provider.dart';
import 'package:todoapp/shared/models/task.model.dart';

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

  void reset() {
    selectedTaskEmojiMood = null;
    pickedDate = DateTime.now();
  }

  void addNewTask(BuildContext context) {
    Provider.of<HomeProvider>(context, listen: false).addTask(TaskModel(
        emojiData: selectedTaskEmojiMood!,
        title: titleController.text,
        description: descriptionController.text,
        date: pickedDate));
    notifyListeners();
  }
}
