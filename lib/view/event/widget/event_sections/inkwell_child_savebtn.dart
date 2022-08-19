import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class InkwellChildSaveBTNWidget extends StatelessWidget {
  const InkwellChildSaveBTNWidget({Key? key, required this.title})
      : super(key: key);
  final String title;
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
          title,
          style: TextStyle(
            fontSize: 15,
            letterSpacing: 3,
            color: textColors.lightTextColor,
          ),
        ),
      ),
    );
  }
}
