import 'package:dashboard/binding/home_binding.dart';
import 'package:dashboard/binding/login_binding.dart';
import 'package:dashboard/middlewares/no_found.dart';
import 'package:dashboard/views/pages/auth/login_page.dart';
import 'package:dashboard/views/pages/error/no_found_page.dart';
import 'package:dashboard/views/pages/home/home_page.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(
    binding: LoginBinding(),
    name: "/login",
    page: () => LoginPage(),
  ),
  GetPage(
    binding: HomeBinding(),
    name: "/",
    middlewares: [
      NoFoundMiddleware(),
    ],
    page: () => HomePage(),
    transition: Transition.leftToRight,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: "/not-found",
    page: () => const NoFoundPage(),
    transitionDuration: const Duration(milliseconds: 400),
  ),
];
