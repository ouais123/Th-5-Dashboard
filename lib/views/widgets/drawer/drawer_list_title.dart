import 'package:dashboard/controllers/home_conttroler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerListTitle extends StatelessWidget {
  DrawerListTitle({
    Key? key,
    required this.title,
    required this.icon,
    required this.index,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final int index;
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5.sp),
      onTap: () => homeController.changeIndex(index),
      child: Obx(
        () => MouseRegion(
          onEnter: (_) => homeController.indexHover.value = index,
          onExit: (_) => homeController.indexHover.value = -1,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              color: color,
            ),
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20.sp,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: "Raleway",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color get color {
    if (homeController.indexPage.value == index)
      return Theme.of(Get.context!).splashColor.withOpacity(0.7);

    if (homeController.indexHover.value == index)
      return Theme.of(Get.context!).splashColor.withOpacity(0.5);

    return Colors.transparent;
  }
}
