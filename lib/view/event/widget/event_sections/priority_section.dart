import 'package:flutter/material.dart';
import 'package:todo/view/event/widget/selctors_widget/event_priority_selector.dart';
import 'package:todo/view/utils/colors.dart';

class PrioritySectionRowWidget extends StatelessWidget {
  const PrioritySectionRowWidget(
      {Key? key, required this.eventPrioritySelectorFunction})
      : super(key: key);
  final Function eventPrioritySelectorFunction;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: todoColors.darkGrey,
          ),
          child: Center(
            child: Icon(
              Icons.priority_high_rounded,
              size: 15,
              color: todoColors.lightGrey,
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
          onSelectColor: (Color newc) => eventPrioritySelectorFunction(newc),
        ),
      ],
    );
  }
}
