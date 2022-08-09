import 'dart:developer';

import 'package:dashboard/core/app/locator_app.dart';
import 'package:dashboard/models/driver.dart';
import 'package:dashboard/services/api/home_service.dart';
import 'package:get/get.dart';

class DriversController extends GetxController {
  final RxInt indexHover = (-1).obs;

  final RxList<Driver> drivers = <Driver>[].obs;

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getDrivers();
  }

  Future<void> getDrivers() async {
    isLoading.value = true;
    HomeService homeService = locator.get<HomeService>();
    List<Driver>? driversTemp =
        await homeService.getDrivers().catchError(errorHandle);

    if (driversTemp != null) drivers.assignAll(driversTemp);

    isLoading.value = false;
  }

  Future<void> acceptDriver(int driverId) async {
    HomeService homeService = locator.get<HomeService>();
    Driver? driverTemp =
        await homeService.acceptDriver(driverId).catchError(errorHandle);

    if (driverTemp != null)
      drivers.removeWhere((element) => element.id == driverId);
  }

  Future<void> deleteDriver(int driverId) async {
    HomeService homeService = locator.get<HomeService>();
    bool? isDeleted = await homeService.deleteDriver(driverId);

    log("$isDeleted");

    if (isDeleted != null)
      drivers.removeWhere((element) => element.id == driverId);
  }

  dynamic errorHandle(error) {
    //do somw work
  }
}
