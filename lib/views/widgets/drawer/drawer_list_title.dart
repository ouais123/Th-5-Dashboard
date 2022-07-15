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
        () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sp),
            color: homeController.indexPage.value == index
                ? Theme.of(context).splashColor
                : Colors.transparent,
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
    );
  }
}
