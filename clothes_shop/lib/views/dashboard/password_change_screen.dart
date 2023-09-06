import 'package:clothes_shop/controller/dashboard/verified_screen.dart';
import 'package:clothes_shop/utils/colors.dart';
import 'package:clothes_shop/utils/custom_text_styles.dart';
import 'package:clothes_shop/utils/validator.dart';
import 'package:clothes_shop/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});

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
            Text("New Password SetUp", style: CustomTextStyles.f16W600()),
            const SizedBox(height: 15),
            const CustomTextField(
              validator: Validators.checkFieldEmpty,
              hint: "Enter New Password",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            const CustomTextField(
              validator: Validators.checkFieldEmpty,
              hint: "Retype New Password",
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
            ),
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
                      Get.to(() => const VerifiedScreen());
                    },
                    child: Text(
                      "UPDATE",
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
