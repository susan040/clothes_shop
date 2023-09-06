import 'package:clothes_shop/views/dashboard/explore_screen.dart';
import 'package:clothes_shop/views/dashboard/home_screen.dart';
import 'package:clothes_shop/views/dashboard/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashScreenController extends GetxController {
  final key = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList([
    HomeScreen(),
    ExploreScreen(),
    ProfileScreen(),
  ]);

  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
