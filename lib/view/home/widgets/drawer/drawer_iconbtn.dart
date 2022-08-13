import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(
          Icons.density_medium_rounded,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    });
  }
}
