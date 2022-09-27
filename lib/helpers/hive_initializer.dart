import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/model/color_adapter.dart';
import 'package:todo/model/event_model.dart';

List<Box> boxList = [];
Future<List<Box>> openBox() async {
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(EventAdapter());
  Hive.registerAdapter(ColorAdapter());
  var eventBox = await Hive.openBox('events');
  var themeBox = await Hive.openBox("isDarkMode");
  var deletedBox = await Hive.openBox("recycle_bin");
  boxList.add(eventBox);
  boxList.add(themeBox);
  boxList.add(deletedBox);
  return boxList;
}
