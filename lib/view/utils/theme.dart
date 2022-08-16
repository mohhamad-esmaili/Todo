import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

final _mainColors = MainColors();
final _textColors = TextColors();
final _todoColors = TodoColors();

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'PTSans',
    scaffoldBackgroundColor: _mainColors.whiteScaffoldColor,

    // textTheme start here --
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: _textColors.darkTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: _textColors.darkTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        color: _textColors.darkTextColor,
      ),
    ),
    // -----------------------

    iconTheme: IconThemeData(color: _textColors.darkTextColor),

    appBarTheme: AppBarTheme(
      backgroundColor: _mainColors.whiteScaffoldColor,
      elevation: 0,
      toolbarHeight: 110,
      iconTheme: IconThemeData(color: _mainColors.blackScaffoldColor),
    ),
  );
  static final darkTheme = ThemeData(
    fontFamily: 'PTSans',
    scaffoldBackgroundColor: _mainColors.blackScaffoldColor,

    // textTheme start here --
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: _textColors.lightTextColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: _textColors.lightTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        color: _textColors.lightTextColor,
      ),
    ),
    // -----------------------

    iconTheme: IconThemeData(color: _todoColors.darkGrey),

    appBarTheme: AppBarTheme(
      backgroundColor: _mainColors.blackScaffoldColor,
      elevation: 0,
      toolbarHeight: 110,
    ),
  );
}
