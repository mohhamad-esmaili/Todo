import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/view/utils/colors.dart';

class AppBarRowWidget extends StatelessWidget {
  const AppBarRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "To do",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        Text(
          DateFormat("EEEE, MMMM d").format(DateTime.now()),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(width: 2),
        Icon(
          Icons.calendar_month_outlined,
          size: 20,
          color: todoColors.darkPurple,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
