import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeState {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  PageController _pageController = PageController();
  PageController get pageController => _pageController;
  set pageController(value) => _pageController = value;
}
