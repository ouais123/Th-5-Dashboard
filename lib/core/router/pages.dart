import 'package:dashboard/binding/home_binding.dart';
import 'package:dashboard/middlewares/not_found.dart';
import 'package:dashboard/views/pages/error/no_found_page.dart';
import 'package:dashboard/views/pages/home/home_page.dart';
import 'package:get/get.dart';

List<GetPage> getPages = [
  GetPage(
    name: "/",
    middlewares: [
      NotFoundMiddleware(),
    ],
    page: () => HomePage(),
    binding: HomeBinding(),
    transition: Transition.leftToRight,
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: "/not-found",
    page: () => const NoFoundPage(),
  ),
];
