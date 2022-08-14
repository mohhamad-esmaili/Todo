import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/controller/theme_controller.dart';
import 'package:todo/view/utils/colors.dart';

final _todoColor = TodoColors();
final _textColors = TextColors();

final BorderRadius _calendarDecoration = BorderRadius.circular(50);
const FontWeight _fontWeight = FontWeight.w600;
const double _fontSize = 20.0;

class CalendarTheme {
  static const CalendarFormat calendarThemeFormat = CalendarFormat.week;
  static final calendarLightMode = CalendarStyle(
    defaultTextStyle: TextStyle(
      color: _textColors.darkTextColor,
      fontSize: _fontSize,
    ),
    todayTextStyle: TextStyle(
      color: _textColors.darkTextColor,
      fontSize: _fontSize,
    ),
    weekendTextStyle: TextStyle(
      color: _textColors.darkTextColor,
      fontSize: _fontSize,
    ),
    selectedTextStyle: TextStyle(
      color: _textColors.lightTextColor,
      fontSize: _fontSize,
    ),
    defaultDecoration: BoxDecoration(borderRadius: _calendarDecoration),
    todayDecoration: BoxDecoration(
      color: _todoColor.lightPurple,
      borderRadius: _calendarDecoration,
    ),
    selectedDecoration: BoxDecoration(
      color: _todoColor.darkPurple,
      borderRadius: _calendarDecoration,
    ),
    weekendDecoration: BoxDecoration(
      borderRadius: _calendarDecoration,
    ),
  );
  static final calendarDarkMode = CalendarStyle(
    defaultTextStyle: TextStyle(
      color: _textColors.calendarTextColor,
      fontSize: _fontSize,
      fontWeight: _fontWeight,
    ),
    todayTextStyle: TextStyle(
      color: _textColors.darkTextColor,
      fontSize: _fontSize,
    ),
    weekendTextStyle: TextStyle(
      color: _textColors.calendarTextColor,
      fontSize: _fontSize,
      fontWeight: _fontWeight,
    ),
    selectedTextStyle: TextStyle(
      color: _textColors.lightTextColor,
      fontSize: _fontSize,
      fontWeight: _fontWeight,
    ),
    defaultDecoration: BoxDecoration(borderRadius: _calendarDecoration),
    todayDecoration: BoxDecoration(
      color: _todoColor.lightPurple,
      borderRadius: _calendarDecoration,
    ),
    selectedDecoration: BoxDecoration(
      color: _todoColor.darkPurple,
      borderRadius: _calendarDecoration,
    ),
    weekendDecoration: BoxDecoration(
      borderRadius: _calendarDecoration,
    ),
    rangeEndDecoration: BoxDecoration(
      borderRadius: _calendarDecoration,
    ),
    markerDecoration: BoxDecoration(
      color: _todoColor.darkGrey,
      borderRadius: _calendarDecoration,
    ),
  );
  static final calendarDayOfWeekTheme = DaysOfWeekStyle(
    weekdayStyle: TextStyle(color: _textColors.calendarTextColor),
    weekendStyle: TextStyle(color: _textColors.calendarTextColor),
  );
}
