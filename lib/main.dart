import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo/controller/hive_initializer.dart';
import 'package:todo/controller/theme_controller.dart';
import 'package:todo/view/home/home_screen.dart';
import 'package:todo/view/splash/splash_screen.dart';
import 'package:todo/view/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await openBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeController().theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    );
  }
}
