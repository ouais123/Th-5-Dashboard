// ignore_for_file: public_member_api_docs, sort_constructors_first
class PieChart {
  double activateDrivers;
  double notActivateDrivers;
  PieChart({
    required this.activateDrivers,
    required this.notActivateDrivers,
  });

  PieChart.fromMap(Map<String, dynamic> map)
      : activateDrivers =
            double.parse((map['activateDrivers'] ?? 0).toString()),
        notActivateDrivers =
            double.parse((map['notActivateDrivers'] ?? 0).toString());
}
