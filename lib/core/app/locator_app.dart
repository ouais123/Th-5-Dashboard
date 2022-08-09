import 'package:dashboard/services/api/auth_service.dart';
import 'package:dashboard/services/api/home_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> setupGetIt() async {
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<HomeService>(() => HomeService());
}
