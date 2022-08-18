import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/controller/theme_controller.dart';
import 'package:todo/view/utils/calendar_theme.dart';

class TableCalendarWidget extends StatelessWidget {
  TableCalendarWidget({Key? key}) : super(key: key);

  final EventController controller = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    // TODO: table calendar doesnt show events on first load
    return GetBuilder<ThemeController>(
      builder: (themeController) => TableCalendar(
        focusedDay: controller.focusedDay.value,
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
          controller.selectedDay.value = selectDay;
          controller.focusedDay.value = focusDay;
          controller.firstLoad.value = false;
        },
        selectedDayPredicate: (DateTime date) {
          return isSameDay(controller.selectedDay.value, date);
        },
        eventLoader: controller.getEvents,
      ),
    );
  }
}
