import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/controller/hive_initializer.dart';
import 'package:todo/model/event_model.dart';

class EventController extends GetxController {
  Map<dynamic, dynamic> items = {};
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  final _eventBox = boxList[0];

  @override
  void onInit() {
    refreshItems();
    super.onInit();
  }

  void refreshItems() {
    final value = _eventBox.get("events") ?? {};
    items = value;
    selectedDay.refresh();
    update();
  }

  Future<void> createItem(String title, Color priority) async {
    if (items[selectedDay.value] != null) {
      items[selectedDay.value].add(Event(
          title: title,
          dateTime: selectedDay.value,
          priority: priority,
          isDone: false));
    } else {
      items[selectedDay.value] = [
        Event(
            title: title,
            dateTime: selectedDay.value,
            priority: priority,
            isDone: false)
      ];
    }
    await _eventBox.put('events', items);
    refreshItems();
  }

  List<Event> getEvents(DateTime date) {
    return List<Event>.from(items[date] ?? []);
  }

  void makeDoneEvent(int index) async {
    List<dynamic> eventList = items[selectedDay.value];
    Event editedEvent = eventList[index];

    editedEvent.isDone = !editedEvent.isDone;

    await _eventBox.put('events', items);
    refreshItems();
  }

  void deleteEvent(int index) async {
    List removedEvent = items[selectedDay.value];
    removedEvent.removeAt(index);
    await _eventBox.put('events', items);
    refreshItems();
  }
}
