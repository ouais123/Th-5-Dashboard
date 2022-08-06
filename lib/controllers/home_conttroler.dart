import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt indexPage = 0.obs;

  final RxInt indexHover = (-1).obs;

  final RxBool isDrawerOutsideVisiable = true.obs;

  final PageController pageController = PageController(
    initialPage: 0,
  );

  void changeIndex(int index) {
    indexPage.value = index;
    pageController.jumpToPage(index);
  }
}
