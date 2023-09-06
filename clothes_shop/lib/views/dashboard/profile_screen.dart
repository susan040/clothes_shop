import 'package:clothes_shop/controller/core_controller.dart';
import 'package:clothes_shop/controller/dashboard/image_controller.dart';
import 'package:clothes_shop/utils/colors.dart';
import 'package:clothes_shop/utils/image_path.dart';
import 'package:clothes_shop/views/dashboard/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/custom_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final a = Get.put(ImagePickController());
  final coreController = Get.put(CoreController());
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
        title: Text("Profile",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Obx(() => ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: (a.image.value != null)
                    ? Image.file(
                        a.image.value!,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              width: 1, color: AppColors.backGroundColor),
                        ),
                        child: ClipRRect(
                          child: Image.asset(
                            ImagePath.profile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))),
          ),
          const SizedBox(height: 10),
          Text(
            "Susan Thapa",
            style: CustomTextStyles.f16W600(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              padding: const EdgeInsets.all(26),
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.lOrange,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => EditProfileScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(ImagePath.person),
                            const SizedBox(width: 15),
                            Text("Profile", style: CustomTextStyles.f16W400()),
                          ],
                        ),
                        SvgPicture.asset(ImagePath.arrowRight)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      coreController.logOut();
                    },
                    child: Text("Log Out", style: CustomTextStyles.f16W400()),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
