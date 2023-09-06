import 'package:clothes_shop/controller/splash_screen_controller.dart';
import 'package:clothes_shop/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash-screen";
  SplashScreen({super.key});

  final c = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          // const CircularProgressIndicator(),
          // const CupertinoActivityIndicator(
          //   radius: 20,
          //   color: Colors.black,
          // ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(ImagePath.logo))),
            ),
          ),

          const CircularProgressIndicator(),
        ],
      ),
    ));
  }
}
