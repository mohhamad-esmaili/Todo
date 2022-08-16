import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/view/home/widgets/bottomsheet/event_priority_selector.dart';

import 'package:todo/view/utils/colors.dart';

class CreateEventSheet extends StatelessWidget {
  CreateEventSheet({Key? key}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  final EventController _eventController = Get.find<EventController>();
  final TodoColors _todoColors = TodoColors();

  @override
  Widget build(BuildContext context) {
    Color selectedPriority = _todoColors.darkGreen;
    return BottomSheet(
      onClosing: () {},
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Colors.black54,
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  maxLength: 25,
                  autofocus: true,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: _todoColors.darkPurple,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: _todoColors.darkPurple,
                      ),
                    ),
                    counterText: '',
                    hintStyle: Theme.of(context).textTheme.titleSmall,
                    hintText: 'What do you need to do?',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: _todoColors.darkPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: _todoColors.darkGrey,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.priority_high_rounded,
                          size: 15,
                          color: _todoColors.lightGrey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Priority",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Spacer(),
                    EventPrioritySelector(
                      onSelectColor: (Color newc) {
                        selectedPriority = newc;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _eventController.createItem(
                          _textEditingController.text, selectedPriority);
                      _textEditingController.clear();
                      Get.back();
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: _todoColors.darkPurple,
                    ),
                    child: Center(
                      child: Text(
                        'S A V E',
                        style: TextStyle(
                          fontSize: 15,
                          color: TextColors().lightTextColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
