import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:dashboard/core/constants/strings.dart';
import 'package:dashboard/core/functions/size.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
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
    if (isMediumLarge(context) || isLarge(context))
      homeController.scaffoldKey.currentState?.closeDrawer();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.border,
          ),
        ),
      ),
      child: ResponsiveWidget(
        large: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.sp),
                    child: Image.asset(
                      "$assetsImages/dashboard-icon.png",
                      height: 38.h,
                      width: 38.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  SelectableText(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 23.sp,
                      color: Theme.of(context).colorScheme.text,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: actions,
            )
          ],
        ),
        medium: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    homeController.scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).colorScheme.text,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SelectableText(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.text,
                  ),
                ),
              ],
            ),
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
          color: Theme.of(Get.context!).colorScheme.text,
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
        color: Theme.of(Get.context!).colorScheme.text,
        size: 30.sp,
      ),
    ),
    SizedBox(
      width: 5.sp,
    ),
  ];
}
