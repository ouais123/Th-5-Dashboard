import 'package:dashboard/controllers/overview_controller.dart';
import 'package:dashboard/util/extension/color_scheme_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardBarChart extends StatelessWidget {
  CardBarChart({Key? key}) : super(key: key);
  final OverViewController overViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 430.h,
        padding: EdgeInsets.all(18.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).colorScheme.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              "Price Statistics",
              maxLines: 1,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: "Raleway",
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SelectableText(
              "Prices entered per week",
              maxLines: 1,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 290.h,
              child: BarChart(
                BarChartData(
                  titlesData: titlesData,
                  barGroups: showingGroups(),
                  gridData: gridData,
                  borderData: borderData,
                  barTouchData: barTouchData,
                ),
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
                SelectableText(
                  "Campaign sent 7 days ago",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> showingGroups() => overViewController.seriesBarChart
      .map((e) => makeGroupData(e.x.toInt(), e.y))
      .toList();

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    Color barColor = Colors.red,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: barColor,
          width: 28.sp,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.transparent,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              final TextStyle style = TextStyle(
                color: const Color(0xff72719b),
                fontFamily: "Raleway",
                fontSize: 12.sp,
              );
              Widget text;
              switch (value.toInt()) {
                case 1:
                  text = SelectableText('Sun', style: style);
                  break;
                case 2:
                  text = SelectableText('Mon', style: style);
                  break;
                case 3:
                  text = SelectableText('Tue', style: style);
                  break;
                case 4:
                  text = SelectableText('Wed', style: style);
                  break;
                case 5:
                  text = SelectableText('Thu', style: style);
                  break;
                case 6:
                  text = SelectableText('Fri', style: style);
                  break;
                case 7:
                  text = SelectableText('Sat', style: style);
                  break;
                default:
                  text = const Text('');
                  break;
              }

              return SideTitleWidget(
                axisSide: meta.axisSide,
                space: 10,
                child: text,
              );
            },
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20000,
            reservedSize: 40,
            getTitlesWidget: (double value, TitleMeta meta) {
              return SelectableText(
                "$value SP",
                style: TextStyle(
                  color: const Color(0xff75729e),
                  fontFamily: "OpenSans",
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      );

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (_) => FlLine(
          strokeWidth: 0.3,
          color: const Color(0xFF575757),
          dashArray: [3],
        ),
      );
  BarTouchData get barTouchData => BarTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.7),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xFFB6B6B6), width: 0.5),
          left: BorderSide(color: Color(0xFFB6B6B6), width: 0.5),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );
}
