import 'package:clothes_shop/controller/dashboard/edit_profile_controller.dart';
import 'package:clothes_shop/controller/dashboard/image_controller.dart';
import 'package:clothes_shop/utils/colors.dart';
import 'package:clothes_shop/utils/custom_text_styles.dart';
import 'package:clothes_shop/utils/image_path.dart';
import 'package:clothes_shop/utils/validator.dart';
import 'package:clothes_shop/widgets/custom/custom_password_textfield.dart';
import 'package:clothes_shop/widgets/custom/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final c = Get.put(EditProfileController());
  final a = Get.put(ImagePickController());

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile",
                style: CustomTextStyles.f16W600(color: AppColors.textColor)),
            InkWell(
              onTap: () {},
              child: Text("Save",
                  style: CustomTextStyles.f16W400(color: AppColors.orange)),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
          // Center(
          //   child: Container(
          //     height: 100,
          //     width: 100,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(100),
          //         border:
          //             Border.all(width: 1, color: AppColors.backGroundColor),
          //         image: const DecorationImage(
          //             fit: BoxFit.cover, image: AssetImage(ImagePath.profile))),
          //   ),
          // ),
          TextButton(
              onPressed: a.pickImage,
              child: Text("Change Avatar",
                  style: CustomTextStyles.f18W600(color: AppColors.orange))),
          const SizedBox(height: 20),
          Form(
              child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomTextField(
                  validator: Validators.checkFieldEmpty,
                  hint: "Name",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  controller: c.fullNameController,
                ),
                const SizedBox(height: 22),
                CustomTextField(
                  validator: Validators.checkEmailField,
                  hint: "Email",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  controller: c.emailController,
                ),
                const SizedBox(height: 22),
                CustomTextField(
                  validator: Validators.checkPhoneField,
                  hint: "Phone No",
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  controller: c.phoneNoController,
                ),
                const SizedBox(height: 22),
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
            ),
          ))
        ]),
      ),
    );
  }
}
