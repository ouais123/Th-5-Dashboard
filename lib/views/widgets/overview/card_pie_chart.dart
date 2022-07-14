import 'package:dashboard/controllers/overview_controller.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:dashboard/views/customs/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardPieChart extends StatelessWidget {
  CardPieChart({Key? key, required this.radiusSize}) : super(key: key);
  final OverViewController overViewController = Get.find();
  final double radiusSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).colorScheme.border,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Statistics",
            style: TextStyle(
              fontSize: 20.sp,
              fontFamily: "Raleway",
            ),
          ),
          Text(
            "Latest availability for drivers",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 290.h,
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                            enabled: true,
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                overViewController.touchedIndex.value = -1;
                                return;
                              }
                              overViewController.touchedIndex.value =
                                  pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                            }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        startDegreeOffset: 180,
                        sectionsSpace: 0,
                        centerSpaceRadius: 0,
                        sections: showingSections,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: overViewController.seriesPieChart
                      .map((e) => Row(
                            children: [
                              Obx(
                                () => Indicator(
                                  color: e.color,
                                  text: e.title,
                                  isSquare: false,
                                  size: 10.sp,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: "Raleway",
                                    color: overViewController
                                                .touchedIndex.value ==
                                            e.index
                                        ? e.color
                                        : Theme.of(context).colorScheme.text,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            height: 0,
            color: Theme.of(context).colorScheme.divider,
            thickness: 0.8.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FluentIcons.history_24_regular,
                size: 15.sp,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5.w,
              ),
              Flexible(
                child: Text(
                  "Campaign sent 2 days ago",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> get showingSections {
    return overViewController.seriesPieChart.map((e) {
      final isTouched = e.index == overViewController.touchedIndex.value;
      final fontSize = (isTouched ? 25.0.sp : 16.0.sp);
      final radius = isTouched ? (radiusSize + 3.w) : radiusSize;
      return PieChartSectionData(
        color: e.color,
        value: e.value,
        title: '${e.value}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          color: const Color(0xffffffff),
        ),
      );
    }).toList();
  }
}
