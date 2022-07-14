import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DigitalStats extends StatelessWidget {
  const DigitalStats({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).colorScheme.border,
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 40.sp,
                ),
                Column(
                  children: [
                    SelectableText(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.text,
                        fontSize: 18.sp,
                      ),
                    ),
                    SelectableText(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Divider(
              color: Theme.of(context).colorScheme.border,
              thickness: 0.8.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.loop,
                  color: Colors.grey,
                  size: 16.sp,
                ),
                SelectableText(
                  "Updated now",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.sp,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
