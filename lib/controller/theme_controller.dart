import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends GetxController {
  final _key = 'isDarkMode';
  final _themeBox = Hive.box('isDarkMode');
  // final _themeBox = boxList[1];

  bool isDark = false;
  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool loadThemeFromBox() => _themeBox.get(_key) ?? false;

  _saveThemeToBox(bool isDarkMode) => _themeBox.put(_key, isDarkMode);

  void switchTheme() {
    isDark = loadThemeFromBox();
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!loadThemeFromBox());
    update();
  }
}
