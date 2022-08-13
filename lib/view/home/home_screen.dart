import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/model/event_model.dart';
import 'package:todo/view/home/widgets/drawer/drawer.dart';
import 'package:todo/view/home/widgets/drawer/drawer_iconbtn.dart';
import 'package:todo/view/utils/calendar_theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final EventController eventController = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: const DrawerIcon(),
        titleSpacing: 0,
        title: const Text("To Do"),
      ),
      body: GetX<EventController>(
        builder: (controller) => Column(
          children: [
            TableCalendar(
              focusedDay: controller.selectedDay.value,
              firstDay: DateTime(1990),
              lastDay: DateTime(2100),
              calendarFormat: CalendarTheme.calendarThemeFormat,
              startingDayOfWeek: StartingDayOfWeek.saturday,
              daysOfWeekVisible: true,
              headerVisible: false,
              weekendDays: const [4, 5],
              daysOfWeekStyle: CalendarTheme.calendarDayOfWeekTheme,
              calendarStyle: CalendarTheme.calendarStyle,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                controller.selectedDay.value = selectDay;
                controller.focusedDay.value = focusDay;
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(controller.selectedDay.value, date);
              },
              eventLoader: eventController.getEvents,
            ),
            ...eventController.getEvents(controller.selectedDay.value).map(
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
        onPressed: () => eventController.createItem(),
      ),
    );
  }
}
