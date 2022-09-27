import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo/controller/event_controller.dart';
import 'package:todo/controller/theme_controller.dart';
import 'package:todo/service/quote_service.dart';
import 'package:todo/view/utils/colors.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final EventController _eventController = Get.find<EventController>();
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    Get.put(ThemeController());
    return Drawer(
      backgroundColor: themeData.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            color: todoColors.lightGrey,
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/logo.svg', width: 50),
                const SizedBox(height: 10),
                FutureBuilder(
                    future: QuoteService().fetchQuoteFromServer(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          style: themeData.textTheme.bodySmall,
                          textAlign: TextAlign.left,
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(
                          color: TodoColors().darkPurple,
                        ),
                      );
                    }),
              ],
            ),
          ),
          ListTile(
            onTap: () => Get.toNamed('recyclebin'),
            leading: Icon(
              Icons.delete,
              color: themeData.iconTheme.color,
            ),
            title: Text(
              'Recycle Bin',
              style: themeData.textTheme.titleSmall,
            ),
            trailing: Text(
              _eventController.getDeletedEvent().length.toString(),
              style: themeData.textTheme.titleSmall,
            ),
          ),
          GetBuilder<ThemeController>(
            builder: (controller) => ListTile(
              leading: Icon(
                controller.isDark.value
                    ? CupertinoIcons.brightness_solid
                    : CupertinoIcons.moon_fill,
                color: themeData.iconTheme.color,
              ),
              title: Text(
                'Dark Theme',
                style: themeData.textTheme.titleSmall,
              ),
              trailing: Switch(
                value: controller.loadThemeFromBox(),
                activeColor: todoColors.darkYellow,
                onChanged: (_) => controller.switchTheme(),
              ),
            ),
            // GetBuilder<ThemeController>(
            //   builder: (controller) => Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Icon(
            //         controller.isDark.value
            //             ? CupertinoIcons.brightness_solid
            //             : CupertinoIcons.moon_fill,
            //         color: themeData.iconTheme.color,
            //       ),
            //       Text(
            //         'Dark Theme',
            //         style: themeData.textTheme.titleSmall,
            //       ),
            //       Switch(
            //         value: controller.loadThemeFromBox(),
            //         activeColor: todoColors.darkYellow,
            //         onChanged: (_) => controller.switchTheme(),
            //       )
            //     ],
            //   ),
            // ),
          ),
          const Spacer(),
          Row(
            children: [
              const SizedBox(width: 15),
              Text(
                "Made BY",
                style: themeData.textTheme.titleSmall,
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.favorite_sharp,
                color: Colors.red[700],
              ),
              const SizedBox(width: 5),
              Text(
                "With Flutter",
                style: themeData.textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
