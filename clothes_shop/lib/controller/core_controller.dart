import 'dart:developer';

import 'package:clothes_shop/models/user.dart';
import 'package:clothes_shop/utils/storage_keys.dart';
import 'package:clothes_shop/views/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  RxString userToken = "".obs;

  @override
  void onInit() async {
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken();
    log("current user--------------------- ${currentUser.value?.email}--");
    log("current user token------------------------${userToken.value}--");
  }

  bool isUserLoggendIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAll(LoginScreen());
  }
}
