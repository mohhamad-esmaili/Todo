import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/widgets/bottom_sheet/event_bottomsheet.dart';

import 'package:todo/view/utils/colors.dart';

class BottomAddEventBTN extends StatelessWidget {
  const BottomAddEventBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.bottomSheet(const AddEventBottomSheet()),
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
            // boxShadow: [
            //   BoxShadow(color: TodoColors().lightYellow, offset: Offset(1, 1))
            // ],
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
