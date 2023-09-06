import 'package:clothes_shop/controller/dashboard/home_screen_controller.dart';
import 'package:clothes_shop/models/pet_item.dart';
import 'package:clothes_shop/views/dashboard/doctor_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  HomeScreen({super.key});
  final c = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (c.loading.value)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: c.allItemsDetails.length,
                itemBuilder: (context, index) {
                  Doctors items = c.allItemsDetails[index];
                  return AllItemsCard(petItems: items);
                }),
      ),
    );
  }
}

class AllItemsCard extends StatelessWidget {
  const AllItemsCard({
    super.key,
    required this.petItems,
  });

  final Doctors petItems;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DoctorsScreen(
              doctors: petItems,
            ));
      },
      child: Container(
        height: 120,
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            //Text(petItems.displayImage ?? ""),
            Text(petItems.id ?? ""),
            Text(petItems.name ?? ""),
            Text(petItems.email ?? ""),
            Text(petItems.experience ?? ""),
          ],
        ),
      ),
    );
  }
}
