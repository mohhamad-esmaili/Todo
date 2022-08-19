import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'PTSans',
    scaffoldBackgroundColor: mainColors.whiteScaffoldColor,

    // textTheme start here --
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: textColors.darkTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: textColors.darkTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        color: textColors.darkTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        color: textColors.darkTextColor,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: textColors.darkTextColor,
      ),
    ),
    // -----------------------

    iconTheme: IconThemeData(color: textColors.darkTextColor),

    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle:
            TextStyle(color: textColors.darkTextColor, fontSize: 20),
        pickerTextStyle:
            TextStyle(color: textColors.darkTextColor, fontSize: 15),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: mainColors.whiteScaffoldColor,
      elevation: 0,
      toolbarHeight: 80,
      iconTheme: IconThemeData(color: mainColors.blackScaffoldColor),
      titleTextStyle: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: textColors.darkTextColor,
      ),
    ),
  );
  static final darkTheme = ThemeData(
    fontFamily: 'PTSans',
    scaffoldBackgroundColor: mainColors.blackScaffoldColor,

    // textTheme start here --
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: textColors.lightTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: textColors.darkTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        color: textColors.lightTextColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        color: textColors.lightTextColor,
      ),
      bodySmall: TextStyle(
        fontSize: 15,
        color: textColors.darkTextColor,
      ),
    ),
    // -----------------------

    iconTheme: IconThemeData(color: todoColors.darkGrey),

    cupertinoOverrideTheme: CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        dateTimePickerTextStyle:
            TextStyle(color: textColors.lightTextColor, fontSize: 20),
        pickerTextStyle:
            TextStyle(color: textColors.lightTextColor, fontSize: 15),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: mainColors.blackScaffoldColor,
      elevation: 0,
      toolbarHeight: 110,
      titleTextStyle: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: textColors.lightTextColor,
      ),
    ),
  );
}
