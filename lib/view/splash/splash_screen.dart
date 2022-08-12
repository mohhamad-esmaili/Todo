import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todo/view/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => Get.offAndToNamed('/home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg', height: 90),
            const SizedBox(
              height: 5,
            ),
            Text(
              'To Do',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 50,
            ),
            LoadingAnimationWidget.horizontalRotatingDots(
              color: TodoColors().darkPurple,
              size: 55,
            ),
          ],
        ),
      ),
    );
  }
}
