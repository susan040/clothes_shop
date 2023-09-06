import 'dart:developer';

import 'package:clothes_shop/models/pet_item.dart';
import 'package:clothes_shop/repo/booking_repo.dart';
import 'package:clothes_shop/repo/pet_item_repo.dart';
import 'package:clothes_shop/utils/custom_snackbar.dart';
import 'package:clothes_shop/views/dashboard/dash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final dateKeys = GlobalKey<FormState>();
  RxList<Doctors> allItemsDetails = <Doctors>[].obs;
  //RxList<AppointmentDetails> appointmentDetails = <AppointmentDetails>[].obs;
  TextEditingController startDateController = TextEditingController();
  var startSelectedDate = DateTime.now().obs;

  RxBool loading = RxBool(false);

  @override
  void onInit() {
    getAllItemsDetails();
    //getAllAppointmentDetails();
    super.onInit();
  }

  getAllItemsDetails() async {
    loading.value = true;
    await PetitemsRepo.getPetItems(onSuccess: (items) {
      loading.value = false;
      allItemsDetails.addAll(items);
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(title: "item", message: message);
    });
  }

  // getAllAppointmentDetails() async {
  //   loading.value = true;
  //   await AppointmentRepo.getAppointments(onSuccess: (appointments) {
  //     loading.value = false;
  //     appointmentDetails.addAll(appointments);
  //   }, onError: (message) {
  //     loading.value = false;
  //     CustomSnackBar.error(title: "appointments", message: message);
  //   });
  // }

  startChooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child ?? Container(),
        );
      },
    );
    if (pickedDate != null) {
      startSelectedDate.value = pickedDate;
      startDateController.text =
          startSelectedDate.value.toString().split(" ")[0];
      log('--------->>>>>>>>>>>>${startDateController.text.toString()}');
    }
  }

  addBooking(String id, String date) async {
    loading.value = true;
    await BookingRepo.addBooking(
      date: date,
      docId: id,
      onSuccess: () {
        loading.value = false;
        Get.offAll(() => DashScreen());
        CustomSnackBar.success(
            title: "Booking", message: "Booking is done sucessfully");
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Booking", message: message);
      }),
    );
  }
}
