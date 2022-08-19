import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/controller/event_controller.dart';

import 'package:todo/view/home/widgets/widget_exporter.dart';
import 'package:todo/view/utils/colors.dart';

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
              const SizedBox(height: 10),
              controller.firstLoad.value
                  ? SizedBox(
                      child: Center(
                        child: Text(
                          "❗ Tap on calendar to refresh ❗",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: todoColors.lightGrey,
                          shadowColor: todoColors.darkGrey,
                        ),
                        child: ReorderableListView.builder(
                          onReorder: (oldIndex, newIndex) =>
                              controller.reorderEvents(oldIndex, newIndex),
                          anchor: 1,
                          shrinkWrap: true,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          clipBehavior: Clip.none,
                          itemCount: controller
                              .getEventsFromDate(controller.selectedDay.value)
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            List allEvents = controller.getEventsFromDate(
                                controller.selectedDay.value);

                            return InkWell(
                              key: ValueKey(index),
                              onTap: () =>
                                  Get.toNamed('/edit-event', arguments: index),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: EventListTileWWidget(
                                  index: index,
                                  dateTime: allEvents[index].dateTime,
                                  title: allEvents[index].title,
                                  description: allEvents[index].description,
                                  priority: allEvents[index].priority,
                                  isDone: allEvents[index].isDone,
                                  remindMe: allEvents[index].remindMe,
                                ),
                              ),
                            );
                          },
                        ),
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
