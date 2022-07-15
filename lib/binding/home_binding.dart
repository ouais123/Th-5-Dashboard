import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/controllers/overview_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => OverViewController());
    Get.put(HomeController());
  }
}
