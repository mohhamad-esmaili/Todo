import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class ReminderSectionRowWidget extends StatelessWidget {
  const ReminderSectionRowWidget(
      {Key? key,
      required this.remindMeBool,
      required this.switchReminderFunction})
      : super(key: key);
  final bool remindMeBool;
  final Function switchReminderFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          remindMeBool
              ? Icons.notifications_active_rounded
              : Icons.notifications_rounded,
          color: todoColors.darkGrey,
        ),
        Text(
          "Remind Me",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Spacer(),
        Switch(
          value: remindMeBool,
          activeColor: todoColors.darkGreen,
          onChanged: (value) => switchReminderFunction(!remindMeBool),
        )
      ],
    );
  }
}
