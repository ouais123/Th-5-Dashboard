import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/views/pages/overview_page.dart';
import 'package:dashboard/views/widgets/home/home_sliver_appbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final List<Widget> pages = [
    OverViewPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Container(
            child: const Text("data"),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(),
            Expanded(
              child: Obx(() => pages[homeController.indexPage.value]),
            ),
          ],
        ),
      ),
    );
  }
}
