import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/model/event_model.dart';
import 'package:todo/view/home/drawer/drawer.dart';
import 'package:todo/view/home/drawer/drawer_iconbtn.dart';

// Home Page
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  EventController eventController = Get.put(EventController());
  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(EventController());
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: DrawerIcon(),
        titleSpacing: 0,
        title: Text('To Do'),
      ),
      body: GetBuilder<EventController>(
        builder: (controller) => Column(
          children: [
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              eventLoader: eventController.getEvents,
            ),
            // ListView.builder(
            //   itemCount: eventController.getEvents(focusedDay).length,
            //   itemBuilder: (BuildContext context, int index) {
            //     List<Event> eventList = eventController.getEvents(focusedDay);
            //     return ListTile(title: Text(eventList[index].title));
            //   },
            // ),
            ...eventController.getEvents(selectedDay).map(
                  (Event event) => ListTile(
                    title: Text(
                      event.title,
                    ),
                  ),
                ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => eventController.createItem(focusedDay),
      ),
    );
  }
}
