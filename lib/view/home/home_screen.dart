import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/controller/event_controller.dart';

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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.getEvents(controller.selectedDay.value).length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 6,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    List allEvents =
                        controller.getEvents(controller.selectedDay.value);

                    return EventListTileWWidget(
                      index: index,
                      title: allEvents[index].title,
                      priority: allEvents[index].priority,
                      isDone: allEvents[index].isDone,
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: const AddEventBTN(),
    );
  }
}
