import 'dart:html';

import 'package:dashboard/core/constants/strings.dart';
import 'package:dashboard/core/functions/platforms.dart';
import 'package:dashboard/core/router/routers.dart';
import 'package:dashboard/services/app/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onReady() {
    _updateUrl();
    super.onReady();
  }

  final SettingService settingService = Get.find();
  late final RxInt indexPage = (settingService.initIndexPage).obs;

  final RxBool isDrawerOutsideVisiable = true.obs;

  late PageController pageController = PageController(
    initialPage: settingService.initIndexPage,
  );

  void changeIndex(int index) {
    indexPage.value = index;
    pageController.jumpToPage(index);
    _updateUrl();
  }

  void _updateUrl() {
    if (isWeb)
      switch (indexPage.value) {
        case 0:
          {
            window.history.pushState("", "", initRouteUrl + Routers.overView);
            break;
          }
        case 1:
          {
            window.history.pushState("", "", initRouteUrl + Routers.driver);
            break;
          }
        case 2:
          {
            window.history.pushState("", "", initRouteUrl + Routers.complaints);
            break;
          }
        case 3:
          {
            window.history.pushState("", "", initRouteUrl + Routers.profile);
            break;
          }
      }
  }
}
