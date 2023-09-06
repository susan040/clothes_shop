import 'dart:async';

import 'package:clothes_shop/controller/core_controller.dart';
import 'package:clothes_shop/views/auth/login_screen.dart';
import 'package:clothes_shop/views/dashboard/dash_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final c = Get.put(CoreController());
  
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () async {
      if (c.isUserLoggendIn()) {
        Get.offAll(() => DashScreen());
      } else {
        Get.offAll(() => LoginScreen());
      }
    });
    super.onInit();
  }
}
