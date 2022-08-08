import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/core/functions/sizes.dart';
import 'package:dashboard/views/pages/complaints/complaints_page.dart';
import 'package:dashboard/views/pages/driver/driver_page.dart';
import 'package:dashboard/views/pages/overview/overview_page.dart';
import 'package:dashboard/views/widgets/drawer/drawer_app.dart';
import 'package:dashboard/views/widgets/home/home_sliver_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    homeController.isDrawerOutsideVisiable.value =
        (isMediumLarge(context) || isLarge(context));

    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: DrawerApp(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(scaffoldKey: scaffoldKey),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => homeController.isDrawerOutsideVisiable.value
                        ? Expanded(
                            child: DrawerApp(),
                          )
                        : const SizedBox(),
                  ),
                  Expanded(
                    flex: 5,
                    child: PageView(
                      controller: homeController.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        OverViewPage(),
                        DriverPage(),
                        ComplaintsPage(),
                        SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
