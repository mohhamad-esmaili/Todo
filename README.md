<h1 align="center">
<img src="assets/images/logo.svg" width="50" />

To do
</h1>

### Dependencies:
```
flutter_local_notifications: ^9.7.1
flutter_svg: ^1.1.3
flutter_time_picker_spinner: ^2.0.0
get: ^4.6.5
hive: ^2.2.3
hive_flutter: ^1.1.0
intl: ^0.17.0
loading_animation_widget: ^1.2.0+2
path_provider: ^2.0.11
table_calendar: ^3.0.6
timezone: ^0.8.0
```




### Folder Structure
```
├───main.dart
├───controller
│   ├───event_controller.dart
│   ├───hive_initializer.dart
│   └───theme_controller.dart
├───model
│   ├───color_adapter.dart
│   ├───event_model.dart
│   └───event_model.g.dart
├───home
│   └───widgets
│       ├───bottomsheet
│       │   ├───add_event_btn.dart
│       │   ├───event_priority_selector.dart
│       │   └───event_sheet.dart
│       │
│       ├───events_listtile
│       │   └───event_sheet.dart
│       │
│       ├───home_appbar
│       │   ├───home_drawer
│       │   │   ├───drawer_iconbtn.dart
│       │   │   └───drawer.dart
│       │   └───appbar_row.dart
│       └───table_calendar
│            └───table_calendar_widget.dart
├───splash
│   └───splash_screen.dart
└───utils
    ├───calendar_theme.dart.dart
    ├───colors.dart
    └───theme.dart
```