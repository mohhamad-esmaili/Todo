import 'package:flutter/material.dart';

class AddEventBottomSheet extends StatelessWidget {
  const AddEventBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Colors.black54,
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [TextFormField()],
          ),
        );
      },
    );
  }
}
