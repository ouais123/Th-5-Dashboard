import 'package:dashboard/core/app/locator_app.dart';
import 'package:dashboard/services/api/home_service.dart';
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

  final TextEditingController priceController = TextEditingController();

  Future<void> addPrice() async {
    HomeService homeService = locator.get<HomeService>();
    bool? isSuccess = await homeService.addPrice(double.parse(priceController.text)).catchError(errorHandle);
    if (isSuccess != null) {
      Get.back();
    }
  }

  dynamic errorHandle(error) {}
}
