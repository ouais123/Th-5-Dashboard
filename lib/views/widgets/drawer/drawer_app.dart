import 'package:dashboard/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: const [],
            ),
          ),
        ),
      ],
    );
  }
}
