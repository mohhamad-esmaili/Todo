import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:share_plus/share_plus.dart';
import 'package:todo/model/event_model.dart';
import 'package:todo/view/utils/colors.dart';

class Helper {
  void shareTask(Event shareEvent) {
    Share.share('''
                  task at ${shareEvent.dateTime} 
title: ${shareEvent.title}

description: ${shareEvent.description}
                  
                  
made by Flutter, download from https://github.com/mohhamad-esmaili/Todo/releases/download/released/todo.apk
                  ''', subject: 'Look at my task');
  }

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

  bool checkTimes(
      DateTime pickedDateTime, DateTime calendarDate, bool remindMe) {
    calendarDate = getExactDateTime(calendarDate);
    DateTime nowTime = DateTime.now();
    print(calendarDate);
    print(pickedDateTime);
    if (remindMe) {
      if (pickedDateTime.year == calendarDate.year &&
          pickedDateTime.day == calendarDate.day) {
        if (pickedDateTime.hour >= calendarDate.hour) {
          if (pickedDateTime.minute > calendarDate.minute) {
            return true;
          } else if (pickedDateTime.hour > calendarDate.hour) {
            return true;
          } else {
            return false;
          }
        }
      } else if (pickedDateTime.hour > calendarDate.hour) {
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
}
