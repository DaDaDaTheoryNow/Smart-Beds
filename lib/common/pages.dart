import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_beds/features/details/controller/binding.dart';
import 'package:smart_beds/features/details/view/plant_details_page.dart';
import 'package:smart_beds/features/home/controller/binding.dart';
import 'package:smart_beds/features/home/view/home_page.dart';

class AppPages {
  static const home = "/home";
  static const plantDetails = "/plant_details";

  static final List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: plantDetails,
      page: () => const PlantDetailsPage(),
      binding: DetailsBinding(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  ];
}
