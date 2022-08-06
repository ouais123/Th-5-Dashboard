import 'package:dashboard/services/app/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoFoundMiddleware extends GetMiddleware {
  final SettingService settingService = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (route == null) return const RouteSettings(name: "/not-found");

    if (route != "/") return const RouteSettings(name: "/not-found");

    return null;
  }
}
