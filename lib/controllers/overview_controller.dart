import 'package:dashboard/models/point.dart';
import 'package:dashboard/models/sections.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class OverViewController extends GetxController {
  final RxInt numUsers = 1300.obs;
  final RxInt numDrivers = 89.obs;
  final RxInt numErrors = 29.obs;
  final RxInt numCompaints = 689.obs;

  final Iterable<Point> seriesLineChart = [
    Point(x: 1, y: 44),
    Point(x: 2, y: 45),
    Point(x: 3, y: 46),
    Point(x: 4, y: 45),
    Point(x: 5, y: 46),
    Point(x: 6, y: 47),
    Point(x: 7, y: 48),
  ];

  final Iterable<Sections> seriesPieChart = [
    Sections(
      title: "Available",
      value: 34.11,
      index: 0,
      color: Colors.red,
    ),
    Sections(
      title: "Stop",
      value: 65.89,
      index: 1,
      color: Colors.orange,
    )
  ];

  final Iterable<Point> seriesBarChart = [
    Point(x: 1, y: 5),
    Point(x: 2, y: 7),
    Point(x: 3, y: 5),
    Point(x: 4, y: 8),
    Point(x: 5, y: 9),
    Point(x: 6, y: 11),
    Point(x: 7, y: 7)
  ];

  final RxInt touchedIndex = (-1).obs;

  final Uri url =
      Uri.parse("https://www.linkedin.com/in/owais-hamouda-878405222/");
}
