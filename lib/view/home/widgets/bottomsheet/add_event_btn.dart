import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/widgets/bottomsheet/event_sheet.dart';
import 'package:todo/view/utils/colors.dart';

class AddEventBTN extends StatelessWidget {
  const AddEventBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.bottomSheet(isScrollControlled: true, CreateEventSheet()),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: TodoColors().lightPurple,
              width: 1.5,
            ),
          ),
          child: Text(
            "What do you need to do?",
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}
