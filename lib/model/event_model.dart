import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  String title;

  @HiveField(2)
  Color priority;

  @HiveField(3)
  bool isDone = false;

  Event(
      {required this.dateTime,
      required this.title,
      required this.priority,
      this.isDone = false});
}
