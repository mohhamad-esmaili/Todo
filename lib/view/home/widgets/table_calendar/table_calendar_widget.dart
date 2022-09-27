import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/controller/theme_controller.dart';
import 'package:todo/view/utils/calendar_theme.dart';

class TableCalendarWidget extends StatelessWidget {
  TableCalendarWidget({Key? key}) : super(key: key);

  final EventController _eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    // TODO: table calendar doesnt show events on first load
    return GetBuilder<ThemeController>(
      builder: (themeController) => TableCalendar(
        focusedDay: _eventController.focusedDay.value,
        firstDay: DateTime(1990),
        lastDay: DateTime(2100),
        calendarFormat: CalendarTheme.calendarThemeFormat,
        startingDayOfWeek: StartingDayOfWeek.saturday,
        daysOfWeekVisible: true,
        headerVisible: false,
        weekendDays: const [4, 5],
        daysOfWeekStyle: CalendarTheme.calendarDayOfWeekTheme,
        calendarStyle: themeController.loadThemeFromBox()
            ? CalendarTheme.calendarDarkMode
            : CalendarTheme.calendarLightMode,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          _eventController.selectedDay.value = selectDay;
          _eventController.focusedDay.value = focusDay;
          _eventController.firstLoad.value = false;
        },
        selectedDayPredicate: (DateTime date) {
          return isSameDay(_eventController.selectedDay.value, date);
        },
        eventLoader: _eventController.getEventsFromDate,
      ),
    );
  }
}
