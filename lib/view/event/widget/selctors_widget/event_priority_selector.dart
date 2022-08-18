import 'package:flutter/material.dart';
import 'package:todo/view/utils/colors.dart';

class EventPrioritySelector extends StatefulWidget {
  final Function onSelectColor;

  const EventPrioritySelector({
    Key? key,
    required this.onSelectColor,
  }) : super(key: key);
  @override
  State<EventPrioritySelector> createState() => _EventPrioritySelectorState();
}

class _EventPrioritySelectorState extends State<EventPrioritySelector> {
  final List<Color> _availableColors = [
    todoColors.darkGreen,
    todoColors.darkYellow,
    todoColors.darkRed,
  ];

  final List<Color> _focusColors = [
    todoColors.lightGreen,
    todoColors.lightYellow,
    todoColors.lightRed,
  ];

  late Color _initialColor = todoColors.darkGreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 30,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _availableColors.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (context, index) {
          final itemColor = _availableColors[index];
          final itemFocus = _focusColors[index];
          return InkWell(
            onTap: () {
              widget.onSelectColor(itemColor);
              setState(() {
                _initialColor = itemColor;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: itemColor == _initialColor ? itemFocus : null,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: itemColor == _initialColor ? itemColor : itemFocus,
                      width: 1,
                    ),
                  ),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
