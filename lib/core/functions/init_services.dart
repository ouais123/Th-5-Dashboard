import 'package:dashboard/services/app/setting_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  Get.putAsync(() => SettingService().init());
}
