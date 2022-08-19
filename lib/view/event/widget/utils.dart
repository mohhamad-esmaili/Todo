import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

bool checkIfTimeIsEqual(DateTime dateTime) {
  final DateTime nowDateTime = DateTime.now();
  if (dateTime.day >= nowDateTime.day) {
    return true;
  }
  return false;
}

/// this function return exact time when day of old datettime is correct
DateTime getExactDateTime(DateTime motherTime) {
  DateTime catchedDatetime = DateTime.now();

  if (catchedDatetime.day == motherTime.day) {
    return catchedDatetime;
  }
  return motherTime;
}

bool checkTimes(DateTime pickedDateTime, DateTime calendarDate, bool remindMe) {
  calendarDate = getExactDateTime(calendarDate);
  if (remindMe) {
    if (pickedDateTime.hour >= calendarDate.hour &&
        pickedDateTime.minute > calendarDate.minute) {
      return true;
    }
    if (pickedDateTime.day > DateTime.now().day) {
      return true;
    }
  } else {
    return true;
  }

  return false;
}

/// getx snackbar for time errors
/// when now time is smaller we call this function to show
SnackbarController showErrorNotification() {
  return Get.snackbar(
    "Error",
    "Remind time must be greater than now time!",
    backgroundColor: todoColors.lightGrey,
    colorText: textColors.darkTextColor,
    isDismissible: true,
    icon: Icon(
      Icons.priority_high_rounded,
      color: todoColors.darkRed,
    ),
  );
}
