import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo/controller/theme_controller.dart';
import 'package:todo/view/utils/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            // height: 200,
            color: TodoColors().lightGrey,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/logo.svg', width: 50),
                const Text(
                  'do what you need to do ;)',
                  style: TextStyle(fontSize: 20, color: Color(0xff464646)),
                )
              ],
            ),
          ),
          GetBuilder<ThemeController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  controller.isDark.value
                      ? CupertinoIcons.brightness_solid
                      : CupertinoIcons.moon_fill,
                  color: Theme.of(context).iconTheme.color,
                ),
                Text(
                  'Dark Theme',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Switch(
                  value: controller.loadThemeFromBox(),
                  activeColor: TodoColors().darkYellow,
                  onChanged: (_) => controller.switchTheme(),
                )
              ],
            ),
          ),
          const Spacer(),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 15),
              Text(
                "Made BY",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.favorite_sharp,
                color: Colors.red[700],
              ),
              const SizedBox(width: 5),
              Text(
                "With Flutter",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
