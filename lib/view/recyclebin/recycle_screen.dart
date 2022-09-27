import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/view/utils/colors.dart';

class RecycleScreen extends StatelessWidget {
  RecycleScreen({Key? key}) : super(key: key);
  final EventController _eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    Get.put(EventController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Recycle Bin'),
        actions: [
          TextButton(
              onPressed: () => Get.dialog(
                    AlertDialog(
                      title: Text(
                        "Are you sure?!",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            "Cancel",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _eventController.deleteAllRecycleEvents();
                            Get.back();
                          },
                          child: Text(
                            "Confirm",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
              style: TextButton.styleFrom(
                foregroundColor: todoColors.darkPurple,
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              child: const Text("Delete All")),
        ],
        leading: IconButton(
          onPressed: () {
            Get.closeAllSnackbars();
            Get.offAndToNamed("home");
          },
          icon: Icon(
            Icons.close_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: todoColors.lightGrey,
            shadowColor: todoColors.darkGrey,
          ),
          child: GetBuilder<EventController>(
            id: "recycle_builder",
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              itemCount: controller.getDeletedEvent().length,
              itemBuilder: (BuildContext context, int index) {
                List allEvents = controller.getDeletedEvent();
                var selectedEvent = allEvents[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Dismissible(
                    key: Key(allEvents[index].title),
                    onDismissed: (direction) =>
                        controller.deleteEventForever(index),
                    background: Center(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: todoColors.lightRed,
                          ),
                          child: Icon(
                            Icons.delete,
                            color: todoColors.darkRed,
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: selectedEvent.isDone
                            ? todoColors.lightYellow
                            : todoColors.lightGrey,
                        border: Border.all(
                          color: selectedEvent.isDone
                              ? todoColors.darkYellow
                              : todoColors.darkGrey,
                          width: 1.5,
                        ),
                        borderRadius: selectedEvent.isDone
                            ? BorderRadius.circular(80)
                            : BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: todoColors.darkGrey, width: 1.5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.done,
                              color: todoColors.darkYellow,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedEvent.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  selectedEvent.description,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            decoration: BoxDecoration(
                              color: selectedEvent.priority,
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
