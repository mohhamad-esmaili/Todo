import 'dart:html';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/model/event_model.dart';
import 'package:todo/controller/hive_initializer.dart';
import 'package:todo/service/notification_service.dart';

class EventController extends GetxController {
  Map<dynamic, dynamic> items = {};
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  final _eventBox = boxList[0];
  var remindMe = false.obs;
  RxBool firstLoad = true.obs;

  @override
  void onInit() {
    refreshItems();
    super.onInit();
  }

  /// this refresh items by getting again from box
  void refreshItems() {
    final value = _eventBox.get("events") ?? {};
    items = value;
    selectedDay.refresh();
    update();
  }

  // generate random id for event
  int randomNumber = Random().nextInt(9000);

  // create todo evnet function
  Future<void> createItem(
      {required DateTime dateTime,
      required String title,
      required String description,
      required Color priority,
      required int remindIn,
      required bool remindMe}) async {
    if (items[dateTime] != null) {
      items[dateTime].add(Event(
        id: randomNumber,
        title: title,
        description: description,
        dateTime: dateTime,
        priority: priority,
        remindIn: remindIn,
        remindMe: remindMe,
        isDone: false,
      ));
    } else {
      items[selectedDay.value] = [
        Event(
          id: randomNumber,
          title: title,
          description: description,
          dateTime: dateTime,
          priority: priority,
          remindIn: remindIn,
          remindMe: remindMe,
          isDone: false,
        )
      ];
    }
    if (remindMe == true) {
      NotificationService().showNotification(
          randomNumber, title, description, dateTime, priority, remindIn);
    }
    await _eventBox.put('events', items);
    refreshItems();
  }

  /// It creats todoEvent with [DateTime] parameter.
  List<Event> getEvents(DateTime date) {
    return List<Event>.from(items[date] ?? []);
  }

  /// make an event done, it makes isDone attribute to true
  /// `int index` parameter needs.
  void makeDoneEvent(int index) async {
    List<dynamic> eventList = items[selectedDay.value];
    Event editedEvent = eventList[index];
    editedEvent.isDone = !editedEvent.isDone;

    NotificationService().cancelNotitication(editedEvent.id);
    await _eventBox.put('events', items);
    refreshItems();
  }

  /// Delete an event from list and database
  /// it needs `int` index of event in list
  void deleteEvent(int index) async {
    List removedEvent = items[selectedDay.value];
    Event singleEvent = removedEvent[index];
    removedEvent.removeAt(index);
    NotificationService().cancelNotitication(singleEvent.id);
    await _eventBox.put('events', items);
    refreshItems();
  }
}
