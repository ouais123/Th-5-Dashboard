import 'package:dashboard/core/app/locator_app.dart';
import 'package:dashboard/core/functions/init_services.dart';
import 'package:dashboard/core/functions/platforms.dart';
import 'package:dashboard/router/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main(List<String> args) async {
  await setupGetIt();
  await initServices();
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isWeb && !isDisktop)
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.black.withOpacity(0.95),
        ),
      );
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFFF7F7F8),
        ),
        defaultTransition: Transition.fadeIn,
        getPages: getPages,
      ),
    );
  }
}
