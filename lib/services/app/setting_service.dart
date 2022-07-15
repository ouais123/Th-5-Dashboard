import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingService extends GetxService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  late GetStorage _getStorage;

  Future<SettingService> init() async {
    bool isSuccess = await GetStorage.init();
    if (isSuccess) _getStorage = GetStorage();
    return this;
  }

  int initIndexPage = 0;
}
