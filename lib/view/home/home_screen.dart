import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/model/event_model.dart';
import 'package:todo/view/home/widgets/bottom_add_btn/bottom_add_btn.dart';
import 'package:todo/view/home/widgets/home_drawer/drawer.dart';
import 'package:todo/view/home/widgets/home_drawer/drawer_iconbtn.dart';
import 'package:todo/view/home/widgets/table_calendar/table_calendar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final EventController eventController = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: const DrawerIcon(),
        titleSpacing: 0,
        title: const Text("To do"),
      ),
      body: GetX<EventController>(
        builder: (controller) => Column(
          children: [
            TableCalendarWidget(),
            ...eventController.getEvents(controller.selectedDay.value).map(
                  (Event event) => ListTile(
                    title: Text(
                      event.title,
                    ),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ),
                ),
          ],
        ),
      ),
      bottomSheet: const BottomAddEventBTN(),
    );
  }
}
