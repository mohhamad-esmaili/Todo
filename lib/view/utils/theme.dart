import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

final _mainColors = MainColors();
final _textColors = TextColors();

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

    appBarTheme: AppBarTheme(
      backgroundColor: _mainColors.whiteScaffoldColor,
      elevation: 0,
      toolbarHeight: 110,
      iconTheme: IconThemeData(color: _mainColors.blackScaffoldColor),
      titleTextStyle: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: _textColors.darkTextColor,
      ),
    ),
  );
  static final darkTheme = ThemeData(
    fontFamily: 'PTSans',
    scaffoldBackgroundColor: _mainColors.blackScaffoldColor,

    // TODO: implement texttheme for darkmode

    appBarTheme: AppBarTheme(
      backgroundColor: _mainColors.blackScaffoldColor,
      elevation: 0,
      toolbarHeight: 110,
      titleTextStyle: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: _textColors.lightTextColor,
      ),
    ),
  );
}
