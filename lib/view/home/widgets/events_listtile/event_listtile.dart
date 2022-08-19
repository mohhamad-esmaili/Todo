import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/view/utils/colors.dart';
import 'package:todo/controller/event_controller.dart';

class EventListTileWWidget extends StatelessWidget {
  EventListTileWWidget(
      {Key? key,
      required this.index,
      required this.dateTime,
      required this.title,
      required this.description,
      required this.priority,
      required this.isDone,
      required this.remindMe})
      : super(key: key);
  final int index;
  final DateTime dateTime;
  final String title;
  final String description;
  final Color priority;
  final bool isDone;
  final bool remindMe;
  final EventController controller = Get.find<EventController>();

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
              onTap: () => controller.setEventDone(index),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: isDone
                    ? null
                    : BoxDecoration(
                        border:
                            Border.all(color: todoColors.darkGrey, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                child: Icon(
                  Icons.done,
                  color: isDone ? todoColors.darkYellow : todoColors.darkGrey,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  remindMe
                      ? Text(
                          DateFormat("HH:mm").format(dateTime),
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      : const SizedBox(),
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
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
            remindMe
                ? Icon(
                    Icons.notifications_rounded,
                    color: todoColors.darkGrey,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
