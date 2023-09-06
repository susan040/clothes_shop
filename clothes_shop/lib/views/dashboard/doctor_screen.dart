import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothes_shop/controller/dashboard/home_screen_controller.dart';
import 'package:clothes_shop/models/pet_item.dart';
import 'package:clothes_shop/utils/colors.dart';
import 'package:clothes_shop/utils/custom_snackbar.dart';
import 'package:clothes_shop/utils/custom_text_styles.dart';
import 'package:clothes_shop/views/dashboard/booking_screen.dart';
import 'package:clothes_shop/widgets/custom/custom_textfield.dart';
import 'package:clothes_shop/widgets/custom/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsScreen extends StatelessWidget {
  static const routeName = "/doctor-screen";
  DoctorsScreen({super.key, required this.doctors});
  final c = Get.put(HomeScreenController());
  final Doctors doctors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Doctor",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 25, left: 25, top: 10, bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height / 2.7,
                imageUrl: doctors.displayImage ?? "",
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/profile.jpg',
                  height: MediaQuery.of(context).size.height / 2.7,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                const Text("Name:"),
                const SizedBox(width: 5),
                Text(doctors.name ?? ""),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                const Text("Email:"),
                const SizedBox(width: 5),
                Text(doctors.email ?? ""),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {},
            title: Row(
              children: [
                const Text("Time:"),
                const SizedBox(width: 5),
                Text(doctors.time ?? ""),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
      bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          height: 60,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CustomElevatedButton(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45.0),
                  ),
                ),
                isScrollControlled: true,
                context: Get.context!,
                builder: ((context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 20,
                        right: 20,
                        left: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: c.dateKeys,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 5,
                            width: 105,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          CustomTextField(
                            onTap: () {
                              c.startChooseDate(context);
                            },
                            readOnly: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters";
                              }
                              return null;
                            },
                            preIconPath: (Icons.calendar_month),
                            controller: c.startDateController,
                            hint: "Select Booking Date",
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.none,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          CustomElevatedButton(
                            title: 'Continue',
                            onTap: () {
                              String selectedDate = c.startDateController.text;
                              String selectedTime = doctors.time.toString();

                              DateTime selectedDateTime =
                                  DateTime.parse("$selectedDate $selectedTime");
                              DateTime currentDateTime = DateTime.now();

                              if (selectedDateTime.isBefore(currentDateTime)) {
                                CustomSnackBar.error(
                                    title: "Time has passed",
                                    message: "Please choose a new date");
                              } else {
                                Get.to(() => Bookings(doc: doctors));
                              }
                            },
                          ),
                          const SizedBox(
                            height: 69,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            },
            title: 'Book Now',
          )),
    );
  }
}
