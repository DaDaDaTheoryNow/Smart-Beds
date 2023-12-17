import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_beds/features/details/controller/binding.dart';
import 'package:smart_beds/features/details/view/plant_details_page.dart';
import 'package:smart_beds/features/beds/view/add_bed.dart';
import 'package:smart_beds/features/beds/view/bed_form.dart';
import 'package:smart_beds/features/home/controller/binding.dart';
import 'package:smart_beds/features/home/view/home_page.dart';
import 'package:smart_beds/features/sign/controller/binding.dart';
import 'package:smart_beds/features/sign/middleware/sign_redirect.dart';
import 'package:smart_beds/features/sign/view/sign_page.dart';
import 'package:smart_beds/features/threads/view/thread_form_page.dart';
import 'package:smart_beds/features/threads/view/thread_messages.dart';

class AppPages {
  static const home = "/home";
  static const plantDetails = "/plant_details";
  static const sign = "/sign";
  static const addBed = "/add_bed";
  static const bedForm = "/bed_form";
  static const threadForm = "/thread_form";
  static const threadMessages = "/thread_messages";

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
    GetPage(
      name: sign,
      page: () => const SignPage(),
      binding: SignBinding(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 700),
      middlewares: [SignRedirectMiddleware()],
    ),
    GetPage(
      name: addBed,
      page: () => const AddBedPage(),
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage(
      name: bedForm,
      page: () => const BedForm(),
    ),
    GetPage(
      name: threadForm,
      page: () => const ThreadForm(),
    ),
    GetPage(
      name: threadMessages,
      page: () => const ThreadMessagesPage(),
    ),
  ];
}
