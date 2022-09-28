import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/model/event_model.dart';
import 'package:todo/helpers/hive_initializer.dart';
import 'package:todo/service/notification_service.dart';

class EventController extends GetxController {
  Map<dynamic, dynamic> _events = {};
  List _recycleEvents = [];

  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var remindMe = false.obs;

  // variable to handle temperary tablecalendar bug
  RxBool firstLoad = true.obs;

  // hive variables
  final _eventBox = boxList[0];
  final _deletedBox = boxList[2];
  final String _eventKey = 'events';
  final String _deletedEventKey = 'recyclebin';

  @override
  void onInit() {
    refreshItems();
    super.onInit();
  }

  void _eventBoxPutter() async {
    await _eventBox.put(_eventKey, _events);
    refreshItems();
  }

  /// this refresh items by getting again from box
  void refreshItems() {
    _events = _eventBox.get(_eventKey) ?? {};
    _recycleEvents = _deletedBox.get(_deletedEventKey) ?? <Event>[];
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
    if (_events[selectedDay.value] != null) {
      _events[selectedDay.value].add(Event(
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
      _events[selectedDay.value] = [
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
    _eventBoxPutter();
  }

  /// It creats todoEvent with [DateTime] parameter.
  List<Event> getEventsFromDate(DateTime date) {
    return List<Event>.from(_events[date] ?? []);
  }

  /// this function returns all events for recycle screen
  List getDeletedEvent() => _recycleEvents;

  /// make an event done, it makes isDone attribute to true
  /// `int index` parameter needs.
  void setEventDone(int index) {
    List<dynamic> eventList = _events[selectedDay.value];
    Event editedEvent = eventList[index];
    editedEvent.isDone = !editedEvent.isDone;

    NotificationService().cancelNotitication(editedEvent.id);
    _eventBoxPutter();
  }

  /// Delete an event from list and database
  /// it needs `int` index of event in list
  void deleteEvent(int index) async {
    List removedEvent = _events[selectedDay.value];
    Event singleEvent = removedEvent[index];
    removedEvent.removeAt(index);
    NotificationService().cancelNotitication(singleEvent.id);
    _recycleEvents.add(singleEvent);
    await _deletedBox.put(_deletedEventKey, _recycleEvents);
    _eventBoxPutter();
  }

  /// delete event for ever
  void deleteEventForever(int index) async {
    _recycleEvents.removeAt(index);
    await _deletedBox.put(_deletedEventKey, _recycleEvents);
    refreshItems();
  }

  void deleteAllRecycleEvents() async {
    _recycleEvents.clear();
    await _deletedBox.put(_deletedEventKey, _recycleEvents);
    refreshItems();
    update(["recycle_builder"]);
  }

  /// edit event and save to box
  /// it needs `int` index of event in list
  Event getEditingEvent(int index) {
    List<Event> editingList = getEventsFromDate(selectedDay.value);
    return editingList[index];
  }

  /// this function will edit a single event and save to box
  /// it needs the `int index` of the event and new event as `Event`
  void editEvent({required int index, required Event newEvent}) {
    List<dynamic> eventList = _events[selectedDay.value];
    Event editedEvent = eventList[index];
    editedEvent = newEvent;
    editedEvent.title = newEvent.title;
    if (newEvent.remindMe) {
      NotificationService().cancelNotitication(newEvent.id);
      NotificationService().showNotification(
          randomNumber,
          newEvent.title,
          newEvent.description,
          newEvent.dateTime,
          newEvent.priority,
          newEvent.remindIn);
    }

    _eventBoxPutter();
  }

  /// this function save ReorderableListView and replace the index of events
  void reorderEvents(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex = newIndex - 1;
    }
    List removedEvent = _events[selectedDay.value];
    Event reorderedEvent = removedEvent.removeAt(oldIndex);
    removedEvent.insert(newIndex, reorderedEvent);
    _eventBoxPutter();
  }
}
