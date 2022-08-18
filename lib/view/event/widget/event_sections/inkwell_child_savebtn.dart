import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class InkwellChildSaveBTNWidget extends StatelessWidget {
  const InkwellChildSaveBTNWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        color: todoColors.darkPurple,
      ),
      child: Center(
        child: Text(
          'S A V E',
          style: TextStyle(
            fontSize: 15,
            color: textColors.lightTextColor,
          ),
        ),
      ),
    );
  }
}
