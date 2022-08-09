import 'dart:developer';

import 'package:dashboard/core/app/locator_app.dart';
import 'package:dashboard/models/user.dart';
import 'package:dashboard/services/api/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwrodController = TextEditingController();
  final RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    AuthService authService = locator.get<AuthService>();
    User? userTemp = await authService
        .login(
          email: emailController.text,
          password: passwrodController.text,
        )
        .catchError(errorHandle);
    log("$userTemp");
    if (userTemp != null) Get.offNamed("/");

    isLoading.value = false;
  }

  dynamic errorHandle(error) {
    //error handle
  }

  @override
  void dispose() {
    emailController.dispose();
    passwrodController.dispose();
    super.dispose();
  }
}
