import 'package:dashboard/controllers/overview_controller.dart';
import 'package:dashboard/views/widgets/overview/card_bar_chart.dart';
import 'package:dashboard/views/widgets/overview/card_line_chart.dart';
import 'package:dashboard/views/widgets/overview/card_pie_chart.dart';
import 'package:dashboard/views/widgets/overview/digital_stats.dart';
import 'package:dashboard/views/widgets/overview/footer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverViewMediumPage extends StatelessWidget {
  OverViewMediumPage({Key? key}) : super(key: key);
  final OverViewController overViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              DigitalStats(
                title: "Users",
                value: overViewController.numUsers.value.toString(),
                icon: FluentIcons.person_24_regular,
                iconColor: Colors.orange,
              ),
              SizedBox(width: 10.w),
              DigitalStats(
                title: "Drivers",
                value: overViewController.numDrivers.value.toString(),
                icon: FluentIcons.vehicle_car_24_regular,
                iconColor: Colors.green,
              ),
              SizedBox(width: 10.w),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              DigitalStats(
                title: "Orders",
                 value: overViewController.numOrders.value.toString(),
                icon: Icons.chair,
                iconColor: Colors.red,
              ),
              SizedBox(width: 10.w),
              DigitalStats(
                title: "Complaints",
                value: overViewController.numCompaints.value.toString(),
                icon: FluentIcons.people_error_24_regular,
                iconColor: Colors.blue,
              ),
              SizedBox(width: 10.w),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10.w),
              CardLineChart(),
              SizedBox(width: 10.w),
              SizedBox(
                width: 80.w,
                child: CardPieChart(radiusSize: 32.w),
              ),
              SizedBox(width: 10.w),
            ],
          ),
          SizedBox(height: 30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10.w),
              CardBarChart(),
              SizedBox(width: 10.w),
              SizedBox(width: 80.w),
              SizedBox(width: 10.w),
            ],
          ),
          SizedBox(height: 80.h),
          Footer(),
        ],
      ),
    );
  }
}
