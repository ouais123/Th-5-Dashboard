import 'package:dashboard/controllers/overview_controller.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  Footer({Key? key}) : super(key: key);
  final OverViewController overViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.border,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              "Dashbord",
              style: buildTextStyle(),
            ),
            Row(
              children: [
                SelectableText(
                  "Develpment By ",
                  style: buildTextStyle(),
                ),
                InkWell(
                  onTap: () async {
                    if (await canLaunchUrl(overViewController.url))
                      await launchUrl(overViewController.url);
                  },
                  child: Text(
                    "Owais Hamouda",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: "OpenSans",
                      color: const Color(0xFF188FBE),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle buildTextStyle() {
    return TextStyle(
      fontSize: 14.sp,
      fontFamily: "OpenSans",
      color: const Color(0xFF6E6E6E),
    );
  }
}
