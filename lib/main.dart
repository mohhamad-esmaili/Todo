import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/helpers/hive_initializer.dart';
import 'package:todo/controller/theme_controller.dart';
import 'package:todo/service/notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:todo/view/view_exporter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();

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
        GetPage(name: '/recyclebin', page: () => RecycleScreen()),
        GetPage(name: '/event', page: () => CreateEventScreen()),
        GetPage(name: '/edit-event', page: () => const EditEventScreen()),
      ],
    );
  }
}
