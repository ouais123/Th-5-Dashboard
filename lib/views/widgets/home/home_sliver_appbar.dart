import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/core/functions/size.dart';
import 'package:dashboard/views/widgets/app/responsiveness.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (isMedium(context) || isLarge(context))
      homeController.scaffoldKey.currentState?.closeDrawer();
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5DCDC),
          ),
        ),
      ),
      child: ResponsiveWidget(
        large: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: SelectableText(
                "Dashboard",
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Row(
              children: actions,
            )
          ],
        ),
        small: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  homeController.scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black.withOpacity(0.7),
                )),
            Row(
              children: actions,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> actions = [
    Align(
      alignment: Alignment.center,
      child: SelectableText(
        "owais hamouda",
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
    ),
    SizedBox(
      width: 3.sp,
    ),
    Padding(
      padding: EdgeInsets.all(7.sp),
      child: Icon(
        FluentIcons.person_24_regular,
        color: Colors.black.withOpacity(0.7),
        size: 30.sp,
      ),
    ),
    SizedBox(
      width: 5.sp,
    ),
  ];
}
