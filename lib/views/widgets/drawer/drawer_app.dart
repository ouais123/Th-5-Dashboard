import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/core/constants/strings.dart';
import 'package:dashboard/views/widgets/drawer/drawer_list_title.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerApp extends StatelessWidget {
  DrawerApp({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "$assetsImages/drawer-background.png",
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Container(
          color: const Color(0xFF282828).withOpacity(0.9),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  DrawerListTitle(
                    title: "OverView",
                    icon: Icons.moving_sharp,
                    onTap: () => homeController.changeIndex(0),
                    index: 0,
                  ),
                  DrawerListTitle(
                    title: "Driver",
                    icon: FluentIcons.vehicle_car_24_regular,
                    onTap: () => homeController.changeIndex(1),
                    index: 1,
                  ),
                  DrawerListTitle(
                    title: "Complaints",
                    icon: FluentIcons.people_swap_24_regular,
                    onTap: () => homeController.changeIndex(2),
                    index: 2,
                  ),
                  DrawerListTitle(
                    title: "Log Out",
                    icon: FluentIcons.sign_out_24_regular,
                    onTap: () async {
                      await Get.offNamed("/login");
                    },
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
