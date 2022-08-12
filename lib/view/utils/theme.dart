import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

final mainColors = MainColors();
final textColors = TextColors();

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'PTSans',
    scaffoldBackgroundColor: mainColors.whiteScaffoldColor,

    // textTheme start here --
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: textColors.darkTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColors.darkTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        color: textColors.darkTextColor,
      ),
    ),
    // -----------------------

    appBarTheme: AppBarTheme(
      backgroundColor: mainColors.whiteScaffoldColor,
      elevation: 0,
      toolbarHeight: 110,
      iconTheme: IconThemeData(color: mainColors.blackScaffoldColor),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: textColors.darkTextColor,
      ),
    ),
  );
  static final darkTheme = ThemeData(
    fontFamily: 'PTSans',
    scaffoldBackgroundColor: mainColors.blackScaffoldColor,

    // TODO: implement texttheme for darkmode

    appBarTheme: AppBarTheme(
      backgroundColor: mainColors.blackScaffoldColor,
      elevation: 0,
      toolbarHeight: 110,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColors.lightTextColor,
      ),
    ),
  );
}
