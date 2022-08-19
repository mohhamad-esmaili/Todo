import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/view/event/widget/selctors_widget/remindin_selector.dart';
import 'package:todo/view/utils/colors.dart';

class AlarmSectionColumnWidget extends StatelessWidget {
  const AlarmSectionColumnWidget(
      {Key? key,
      required this.initialDateTimeForSelector,
      required this.remindInFunction,
      required this.cupertinoDatePickerFunction})
      : super(key: key);
  final DateTime initialDateTimeForSelector;
  final Function remindInFunction;
  final Function cupertinoDatePickerFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventReminderTimeSelectorWidget(
          onSelectColor: (value) => remindInFunction(value),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Icon(
              Icons.access_alarms_rounded,
              color: todoColors.darkGrey,
            ),
            const SizedBox(width: 5),
            Text(
              DateFormat("HH:mm").format(DateTime.now()),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            initialDateTime: initialDateTimeForSelector,
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onDateTimeChanged: (DateTime value) =>
                cupertinoDatePickerFunction(value),
          ),
        )
      ],
    );
  }
}
