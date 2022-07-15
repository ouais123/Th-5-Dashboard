import 'dart:developer';

import 'package:dashboard/core/router/routers.dart';
import 'package:dashboard/services/app/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int indexPage = 0;

class NotFoundMiddleware extends GetMiddleware {
  final SettingService settingService = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    log("----------------------------------------");
    log(route.toString());
    log("----------------------------------------");
    if (route == null) return const RouteSettings(name: "/not-found");
    if (!isAllow(route)) return const RouteSettings(name: "/not-found");

    return null;
  }

  bool isAllow(String route) {
    switch (route) {
      case Routers.home:
        {
          settingService.initIndexPage = 0;
          return true;
        }

      case Routers.overView:
        {
          settingService.initIndexPage = 0;
          return true;
        }

      case Routers.driver:
        {
          settingService.initIndexPage = 1;
          return true;
        }
      case Routers.complaints:
        {
          settingService.initIndexPage = 2;
          return true;
        }
      case Routers.profile:
        {
          settingService.initIndexPage = 3;
          return true;
        }

      default:
        return false;
    }
  }
}
