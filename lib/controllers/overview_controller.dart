import 'package:dashboard/core/app/locator_app.dart';
import 'package:dashboard/models/overview.dart';
import 'package:dashboard/models/point.dart';
import 'package:dashboard/models/sections.dart';
import 'package:dashboard/services/api/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class OverViewController extends GetxController {
  final RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getOverView();
  }

  Future<void> getOverView() async {
    isLoading.value = true;
    HomeService homeService = locator.get<HomeService>();
    OverView? overView = await homeService.getOverView();

    if (overView != null) {
      numUsers.value = overView.numUsers;
      numDrivers.value = overView.numDrivers;
      numOrders.value = overView.numOrders;
      numCompaints.value = overView.numCompaints;

      seriesPieChart.add(Sections(
        title: "Available",
        value: overView.pieChart.activateDrivers,
        index: 0,
        color: Colors.red,
      ));
      seriesPieChart.add(Sections(
        title: "Stop",
        value: overView.pieChart.notActivateDrivers,
        index: 1,
        color: Colors.orange,
      ));

      seriesLineChart.add(
        Point(
          x: 1,
          y: overView.lineChart.sunday.toDouble(),
        ),
      );
      seriesLineChart.add(
        Point(
          x: 2,
          y: overView.lineChart.monday.toDouble(),
        ),
      );
      seriesLineChart.add(
        Point(
          x: 3,
          y: overView.lineChart.tuesday.toDouble(),
        ),
      );
      seriesLineChart.add(
        Point(
          x: 4,
          y: overView.lineChart.wendnesday.toDouble(),
        ),
      );
      seriesLineChart.add(
        Point(
          x: 5,
          y: overView.lineChart.thersday.toDouble(),
        ),
      );
      seriesLineChart.add(
        Point(
          x: 6,
          y: overView.lineChart.friday.toDouble(),
        ),
      );
      seriesLineChart.add(
        Point(
          x: 7,
          y: overView.lineChart.saturday.toDouble(),
        ),
      );

      seriesBarChart.add(
        Point(
          x: 1,
          y: overView.barChart.sunday.toDouble(),
        ),
      );
      seriesBarChart.add(
        Point(
          x: 2,
          y: overView.barChart.monday.toDouble(),
        ),
      );
      seriesBarChart.add(
        Point(
          x: 3,
          y: overView.barChart.tuesday.toDouble(),
        ),
      );
      seriesBarChart.add(
        Point(
          x: 4,
          y: overView.barChart.wendnesday.toDouble(),
        ),
      );
      seriesBarChart.add(
        Point(
          x: 5,
          y: overView.barChart.thersday.toDouble(),
        ),
      );
      seriesBarChart.add(
        Point(
          x: 6,
          y: overView.barChart.friday.toDouble(),
        ),
      );
      seriesBarChart.add(
        Point(
          x: 7,
          y: overView.barChart.saturday.toDouble(),
        ),
      );
    }

    isLoading.value = false;
  }

  final RxInt numUsers = 0.obs;
  final RxInt numDrivers = 0.obs;
  final RxInt numOrders = 0.obs;
  final RxInt numCompaints = 0.obs;

  final List<Sections> seriesPieChart = [];

  final List<Point> seriesLineChart = [];

  final List<Point> seriesBarChart = [];

  final RxInt touchedIndex = (-1).obs;

  final Uri url =
      Uri.parse("https://www.linkedin.com/in/owais-hamouda-878405222/");
}
