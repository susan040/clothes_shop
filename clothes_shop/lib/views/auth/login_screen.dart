import 'package:clothes_shop/controller/auth/login_screen_controller.dart';
import 'package:clothes_shop/utils/colors.dart';
import 'package:clothes_shop/utils/validator.dart';
import 'package:clothes_shop/views/auth/register_screen.dart';
import 'package:clothes_shop/views/dashboard/forget_password_screen.dart';
import 'package:clothes_shop/widgets/custom/custom_password_textfield.dart';
import 'package:clothes_shop/widgets/custom/custom_textfield.dart';
import 'package:clothes_shop/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/custom_text_styles.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login-screen";
  LoginScreen({super.key});
  final c = Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Form(
                key: c.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login Here",
                      style: CustomTextStyles.f16W600(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Email Address",
                      style: CustomTextStyles.f14W400(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      validator: Validators.checkEmailField,
                      controller: c.emailController,
                      hint: "Email",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Password",
                      style: CustomTextStyles.f14W400(),
                    ),
                    Obx(
                      () => CustomPasswordField(
                        validator: Validators.checkPasswordField,
                        hint: "Password",
                        eye: c.passwordObscure.value,
                        onEyeClick: c.onEyeCLick,
                        controller: c.passwordController,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 180),
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPasswordScreen());
                  },
                  child: const Text("Forget Password?")),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomElevatedButton(
              title: "Login",
              onTap: () {
                // if (c.formKey.currentState!.validate()) {
                //   CustomSnackBar.success(
                //       title: "Login ", message: "Login Successful");
                //   Get.offAll(() => DashScreen());
                // }

                c.onSubmit();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: CustomTextStyles.f14W400()),
                TextButton(
                    onPressed: () {
                      Get.offAll(() => RegisterScreen());
                    },
                    child: Text(
                      "Register",
                      style: CustomTextStyles.f14W400(
                          color: AppColors.primaryColor),
                    )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
