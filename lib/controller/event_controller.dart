import 'dart:collection';
import 'package:get/get.dart';

import 'package:todo/controller/hive_initializer.dart';

import 'package:todo/model/event_model.dart';

class EventController extends GetxController {
  List<LinkedHashMap<dynamic, dynamic>> items = [];
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  final _eventBox = boxList[0];

  @override
  void onInit() {
    refreshItems();
    super.onInit();
  }

  void refreshItems() {
    _eventBox.keys.map((key) {
      final value = _eventBox.get(key);
      items.add(value);
      return value;
    }).toList();

    selectedDay.refresh();
    update();
  }

  Future<void> createItem() async {
    await _eventBox.add({
      focusedDay.value: [Event(title: "new", dateTime: focusedDay.value)]
    });
    refreshItems();
  }

  List<Event> getEvents(DateTime day) {
    for (var eventList in items) {
      if (eventList[day] != null) {
        return List<Event>.from(eventList[day]);
      }
    }
    return [];
  }
}
