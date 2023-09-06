import 'package:clothes_shop/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: false,
      //   backgroundColor: Colors.white,
      //   // leading: InkWell(
      //   //   onTap: () => Get.back(),
      //   //   child: const Icon(
      //   //     Icons.arrow_back,
      //   //     color: Colors.black,
      //   //   ),
      //   // ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Email Verified", style: CustomTextStyles.f24W600()),
              const SizedBox(height: 12),
              Text(
                "Congratulations, your email is verified. Now you can exploer the app",
                textAlign: TextAlign.center,
                style: CustomTextStyles.f16W400(
                    color: AppColors.secondaryTextColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
