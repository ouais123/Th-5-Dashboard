import 'package:dashboard/controllers/complaints_conttroler.dart';
import 'package:dashboard/controllers/drivers_controller.dart';
import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/controllers/overview_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ComplaintsConttroler());
    Get.lazyPut(() => DriversController());
    Get.lazyPut(() => OverViewController());
    Get.put(HomeController());
  }
}
