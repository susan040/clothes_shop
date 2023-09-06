import 'package:clothes_shop/models/appointment.dart';
import 'package:clothes_shop/repo/appointment_repo.dart';
import 'package:clothes_shop/utils/custom_snackbar.dart';
import 'package:get/get.dart';

class HistoryScreenController extends GetxController {
  RxList<AppointmentDetails> appointmentDetails = <AppointmentDetails>[].obs;

  RxBool loading = RxBool(false);

  @override
  void onInit() {
    getAllAppointmentDetails();
    super.onInit();
  }

  getAllAppointmentDetails() async {
    loading.value = true;
    await AppointmentRepo.getAppointments(onSuccess: (appointments) {
      loading.value = false;
      appointmentDetails.addAll(appointments);
    }, onError: (message) {
      loading.value = false;
      CustomSnackBar.error(title: "appointments", message: message);
    });
  }
}
