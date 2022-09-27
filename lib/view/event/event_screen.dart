import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo/controller/event_controller.dart';
import 'package:todo/helpers/helper.dart';
import 'package:todo/view/event/widget/widget_exporter.dart';

import 'package:todo/view/utils/colors.dart';

class CreateEventScreen extends StatelessWidget {
  CreateEventScreen({Key? key}) : super(key: key);
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingCotroller =
      TextEditingController();
  final EventController _eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    DateTime pickedDateTime = _eventController.selectedDay.value;
    int remindIn = 0;
    Color selectedPriority = todoColors.darkGreen;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Add Todo'),
        leading: IconButton(
          onPressed: () {
            Get.closeAllSnackbars();
            _eventController.remindMe.value = false;
            Get.back();
          },
          icon: Icon(
            Icons.close_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: GetX<EventController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TitleTextformfieldWidget(
                    titleEditingController: _titleEditingController),
                const SizedBox(height: 20),
                DescriptionTextformfieldWidget(
                    descriptionEditingCotroller: _descriptionEditingCotroller),
                const SizedBox(height: 20),
                Helper().checkIfTimeIsEqual(controller.selectedDay.value)
                    ? ReminderSectionRowWidget(
                        remindMeBool: controller.remindMe.value,
                        switchReminderFunction: (remindInNewValue) =>
                            controller.remindMe.value = remindInNewValue,
                      )
                    : const SizedBox(),
                AnimatedOpacity(
                  opacity: _eventController.remindMe.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: _eventController.remindMe.value
                      ? AlarmSectionColumnWidget(
                          initialDateTimeForSelector:
                              _eventController.selectedDay.value,
                          remindInFunction: (value) => remindIn = value,
                          cupertinoDatePickerFunction: (DateTime value) =>
                              pickedDateTime = value,
                        )
                      : const SizedBox(height: 20),
                ),
                PrioritySectionRowWidget(
                  eventPrioritySelectorFunction: (value) =>
                      selectedPriority = value,
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    if (_titleEditingController.text.isNotEmpty) {
                      if (Helper().checkTimes(
                              pickedDateTime,
                              _eventController.selectedDay.value,
                              _eventController.remindMe.value) ==
                          true) {
                        _eventController.createItem(
                          dateTime: pickedDateTime,
                          title: _titleEditingController.text,
                          description: _descriptionEditingCotroller.text,
                          priority: selectedPriority,
                          remindMe: _eventController.remindMe.value,
                          remindIn: remindIn,
                        );
                        _titleEditingController.clear();
                        _descriptionEditingCotroller.clear();
                        _eventController.remindMe.value = false;
                        Get.closeAllSnackbars();
                        Get.back();
                      } else {
                        Helper().showErrorNotification();
                      }
                    }
                  },
                  child: const InkwellChildSaveBTNWidget(title: "SAVE"),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
