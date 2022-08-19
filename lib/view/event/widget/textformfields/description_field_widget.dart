import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class DescriptionTextformfieldWidget extends StatelessWidget {
  const DescriptionTextformfieldWidget(
      {Key? key, required this.descriptionEditingCotroller})
      : super(key: key);
  final TextEditingController descriptionEditingCotroller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 8,
      controller: descriptionEditingCotroller,
      textInputAction: TextInputAction.newline,
      style: Theme.of(context).textTheme.bodyMedium,
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
        hintText: 'Tell me more about it :)',
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
