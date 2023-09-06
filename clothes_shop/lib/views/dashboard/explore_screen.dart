import 'package:clothes_shop/controller/dashboard/history_screen_controller.dart';
import 'package:clothes_shop/models/appointment.dart';
import 'package:clothes_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  static const String routeName = "/explore-screen";
  ExploreScreen({super.key});
  final c = Get.put(HistoryScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          c.appointmentDetails.clear();
          c.getAllAppointmentDetails();
        },
        child: SafeArea(
          child: Obx(
            () => (c.loading.value)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: c.appointmentDetails.length,
                    itemBuilder: (context, index) {
                      AppointmentDetails appointments =
                          c.appointmentDetails[index];
                      return AllAppointmets(appointmentDetails: appointments);
                    }),
          ),
        ),
      ),
    );
  }
}

class AllAppointmets extends StatelessWidget {
  const AllAppointmets({
    super.key,
    required this.appointmentDetails,
  });

  final AppointmentDetails appointmentDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.lOrange, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          //Text(petItems.displayImage ?? ""),
          Text(appointmentDetails.id ?? ""),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Patient:"),
              Text(appointmentDetails.patients ?? ""),
            ],
          ),
          Text(appointmentDetails.email ?? ""),
          Text(appointmentDetails.experience ?? ""),
          Text(appointmentDetails.date ?? ""),
          Text(appointmentDetails.bioData ?? ""),
        ],
      ),
    );
  }
}
