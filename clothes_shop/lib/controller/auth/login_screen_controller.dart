import 'dart:convert';

import 'package:clothes_shop/controller/core_controller.dart';
import 'package:clothes_shop/repo/login_repo.dart';
import 'package:clothes_shop/utils/custom_snackbar.dart';
import 'package:clothes_shop/utils/storage_keys.dart';
import 'package:clothes_shop/views/dashboard/dash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool passwordObscure = true.obs;

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  RxBool isChecked = false.obs;
  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "Please wait..");
      await LoginRepo.login(
          email: emailController.text,
          password: passwordController.text,
          onSuccess: (user, token) async {
            loading.hide();
            final box = GetStorage();
            await box.write(StorageKeys.USER, json.encode(user.toJson()));
            await box.write(StorageKeys.ACCESS_TOKEN, token.toString());
            Get.find<CoreController>().loadCurrentUser();
            Get.offAll(() => DashScreen());
            CustomSnackBar.success(title: "Login", message: "Login Successful");
          },
          onError: (message) {
            loading.hide();
            CustomSnackBar.error(title: "Login", message: message);
          });
    }
  }
}
