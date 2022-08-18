import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class EventReminderTimeSelectorWidget extends StatefulWidget {
  final Function onSelectColor;

  const EventReminderTimeSelectorWidget({
    Key? key,
    required this.onSelectColor,
  }) : super(key: key);
  @override
  State<EventReminderTimeSelectorWidget> createState() =>
      _EventReminderTimeSelectorWidgetState();
}

class _EventReminderTimeSelectorWidgetState
    extends State<EventReminderTimeSelectorWidget> {
  final List<int> _availableMinutes = [
    0,
    15,
    60,
    1440,
  ];

  final List<String> _availableReminderText = [
    "Off",
    "15 min before",
    "An hour before",
    "In 24 hours",
  ];

  late int _initialMinute = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _availableMinutes.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (context, index) {
          final itemReminder = _availableMinutes[index];
          return InkWell(
            onTap: () {
              widget.onSelectColor(itemReminder);
              setState(() {
                _initialMinute = itemReminder;
              });
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: itemReminder == _initialMinute
                    ? todoColors.darkPurple
                    : todoColors.lightPurple,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                _availableReminderText[index],
                style: TextStyle(
                  fontSize: 15,
                  color: itemReminder == _initialMinute
                      ? TextColors().lightTextColor
                      : TextColors().darkTextColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
