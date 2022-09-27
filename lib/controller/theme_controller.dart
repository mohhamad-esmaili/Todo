import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/helpers/hive_initializer.dart';

class ThemeController extends GetxController {
  final _key = 'isDarkMode';
  final _themeBox = boxList[1];
  RxBool isDark = false.obs;

  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool loadThemeFromBox() => _themeBox.get(_key) ?? false;

  _saveThemeToBox(bool isDarkMode) => _themeBox.put(_key, isDarkMode);

  void switchTheme() {
    isDark = loadThemeFromBox().obs;
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!loadThemeFromBox());
    update();
  }
}
