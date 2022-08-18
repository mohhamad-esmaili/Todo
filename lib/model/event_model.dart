import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'event_model.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  Color priority;

  @HiveField(5)
  bool isDone = false;

  @HiveField(6)
  int remindIn = 15;

  @HiveField(7)
  bool remindMe = false;

  Event({
    required this.id,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.priority,
    this.isDone = false,
    this.remindIn = 15,
    this.remindMe = false,
  });
}
