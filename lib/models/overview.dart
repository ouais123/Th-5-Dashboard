// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/models/bar_chart.dart';
import 'package:dashboard/models/line_chart.dart';
import 'package:dashboard/models/pie_chart.dart';

class OverView {
  final int numUsers;
  final int numDrivers;
  final int numOrders;
  final int numCompaints;
  final PieChart pieChart;
  final LineChart lineChart;
  final BarChart barChart;
  OverView({
    required this.numUsers,
    required this.numDrivers,
    required this.numOrders,
    required this.numCompaints,
    required this.pieChart,
    required this.lineChart,
    required this.barChart,
  });

  OverView.formMap(Map<String, dynamic> map)
      : numUsers = map['countUsers'] ?? 0,
        numDrivers = map['countVehicles'] ?? 0,
        numOrders = map['numOrders'] ?? 0,
        numCompaints = map['numCompaints'] ?? 0,
        pieChart = PieChart.fromMap(map['pieChart'] ?? {}),
        lineChart =
            LineChart.fromMap(map['lineChart']?['ordersInDaysWeek'] ?? {}),
        barChart = BarChart.fromMap(map['barChart']?['countOrdersPrice'] ?? {});
}
