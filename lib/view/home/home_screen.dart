import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/model/event_model.dart';

import 'package:todo/view/home/widgets/widget_exporter.dart';

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
        title: const AppBarRowWidget(),
      ),
      body: GetX<EventController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TableCalendarWidget(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    controller.getEvents(controller.selectedDay.value).length,
                itemBuilder: (BuildContext context, int index) {
                  List<Event> allEvents =
                      controller.getEvents(controller.selectedDay.value);
                  return ListTile(
                    tileColor: allEvents[index].priority,
                    title: Text(allEvents[index].title),
                    trailing: IconButton(
                      onPressed: () => controller.deleteEvent(index),
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => eventController.createItem('1', Colors.red),
      // ),
      bottomSheet: const AddEventBTN(),
    );
  }
}
