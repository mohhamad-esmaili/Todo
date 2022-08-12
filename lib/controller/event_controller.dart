import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/event_model.dart';

class EventController extends GetxController {
  List<LinkedHashMap<dynamic, dynamic>> items = [];

  final _eventBox = Hive.box('events');

  var allEvents = <DateTime, List<Event>>{};
  @override
  void onInit() {
    refreshItems();
    super.onInit();
  }

  void refreshItems() {
    _eventBox.keys.map((key) {
      final value = _eventBox.get(key);
      print(value.runtimeType);
      items.add(value);
      return value;
    }).toList();
    update();
  }

  Future<void> createItem(
    DateTime focusedDay,
  ) async {
    await _eventBox.add({
      focusedDay: [
        Event(dateTime: focusedDay, title: "new", priority: Colors.red)
      ]
    });
    refreshItems();
    update();
  }

  List<Event> getEvents(DateTime day) {
    for (var eventList in items) {
      if (eventList[day] != null) {
        print(eventList[day]);
        return List<Event>.from(eventList[day]);
      }
    }
    return [];
  }
}
