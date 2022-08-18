import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class TitleTextformfieldWidget extends StatelessWidget {
  const TitleTextformfieldWidget(
      {Key? key, required this.titleEditingController})
      : super(key: key);
  final TextEditingController titleEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 25,
      autofocus: true,
      controller: titleEditingController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: todoColors.darkPurple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: todoColors.darkPurple,
          ),
        ),
        counterText: '',
        hintStyle: Theme.of(context).textTheme.titleSmall,
        hintText: 'What do you need to do?',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: todoColors.darkPurple,
          ),
        ),
      ),
    );
  }
}
