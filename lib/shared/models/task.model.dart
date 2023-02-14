import 'package:animated_emoji/emojis.dart';

class TaskModel {
  AnimatedEmojiData emojiData;
  String title;
  String description;
  DateTime date;

  TaskModel(
      {required this.emojiData,
      required this.title,
      required this.description,
      required this.date});
}

enum TaskAction { delete, edit }
