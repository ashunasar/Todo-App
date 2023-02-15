import 'package:animated_emoji/emojis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task.model.g.dart';

@JsonSerializable()
class TaskModel {
  String emojiDataId;
  String title;
  String description;
  @TimestampConverter()
  DateTime date;

  TaskModel(
      {required this.emojiDataId,
      required this.title,
      required this.description,
      required this.date});

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}

enum TaskAction { delete, edit }

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
