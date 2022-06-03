import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/images/icons/2.svg',
              width: Get.width - 100,
            ),
          ),
          Center(
            child: Text(
              'بيكس بالعربي',
              style: TextStyle(fontSize: 35),
            ),
          ),
        ],
      ),
    );
  }
}
