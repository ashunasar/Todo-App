import 'package:animated_emoji/emojis.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/emoji_picker.widget.dart';

class TaskProvider extends ChangeNotifier {
  DateTime pickedDate = DateTime.now();
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
}
