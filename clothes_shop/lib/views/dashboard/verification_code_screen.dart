import 'package:clothes_shop/utils/colors.dart';
import 'package:clothes_shop/utils/custom_text_styles.dart';
import 'package:clothes_shop/utils/validator.dart';
import 'package:clothes_shop/views/dashboard/password_change_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom/custom_textfield.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text("Back",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter Verification Code", style: CustomTextStyles.f16W600()),
            const SizedBox(height: 15),
            const CustomTextField(
              validator: Validators.checkFieldEmpty,
              hint: "Verification Code",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text("Didn`t receive code", style: CustomTextStyles.f16W400()),
                const SizedBox(width: 7),
                Text("Resend Code",
                    style: CustomTextStyles.f16W400(color: AppColors.orange)),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(color: AppColors.backGroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 7, right: 10),
              child: SizedBox(
                height: 40,
                width: 130,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange),
                    onPressed: () {
                      Get.to(()=> const PasswordChangeScreen());
                    },
                    child: Text(
                      "00:35",
                      style: CustomTextStyles.f16W400(
                          color: AppColors.backGroundColor),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
