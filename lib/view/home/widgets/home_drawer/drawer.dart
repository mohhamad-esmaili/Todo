import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/theme_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          const Spacer(),
          TextButton.icon(
            icon: Icon(
              Icons.category_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.toNamed('/category-add'),
            label: Text(
              'categories',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          GetBuilder<ThemeController>(
            builder: (controller) => TextButton.icon(
              onPressed: () => controller.switchTheme(),
              icon: Icon(
                controller.isDark.value
                    ? CupertinoIcons.brightness_solid
                    : CupertinoIcons.moon_fill,
                color: Theme.of(context).iconTheme.color,
              ),
              label: Text(
                controller.isDark.value ? 'Dark Theme: on' : 'Dark Theme: off',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
