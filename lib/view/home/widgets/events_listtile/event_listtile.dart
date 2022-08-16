import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo/view/utils/colors.dart';
import 'package:todo/controller/event_controller.dart';

class EventListTileWWidget extends StatelessWidget {
  EventListTileWWidget(
      {Key? key,
      required this.index,
      required this.title,
      required this.priority,
      required this.isDone})
      : super(key: key);
  final int index;
  final String title;
  final Color priority;
  final bool isDone;
  final EventController controller = Get.find<EventController>();
  final TodoColors todoColors = TodoColors();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(title),
      onDismissed: (direction) => controller.deleteEvent(index),
      background: Container(
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
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDone ? todoColors.darkYellow : todoColors.darkGrey,
            width: 1,
          ),
          borderRadius:
              isDone ? BorderRadius.circular(80) : BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => controller.makeDoneEvent(index),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: isDone
                    ? null
                    : BoxDecoration(
                        border:
                            Border.all(color: todoColors.darkGrey, width: 1),
                        borderRadius: BorderRadius.circular(30)),
                child: Icon(
                  Icons.done,
                  color: isDone ? todoColors.darkYellow : todoColors.darkGrey,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: priority,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
