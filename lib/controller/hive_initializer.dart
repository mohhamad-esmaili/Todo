import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/model/event_model.dart';

List<Box> boxList = [];
Future<List<Box>> openBox() async {
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  var eventBox = await Hive.openBox('events');
  var themeBox = await Hive.openBox("isDarkMode");
  Hive.registerAdapter(EventAdapter());
  boxList.add(eventBox);
  boxList.add(themeBox);
  return boxList;
}
