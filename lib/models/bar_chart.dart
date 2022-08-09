class BarChart {
  final double monday;
  final double tuesday;
  final double wendnesday;
  final double thersday;
  final double friday;
  final double saturday;
  final double sunday;
  BarChart({
    required this.monday,
    required this.tuesday,
    required this.wendnesday,
    required this.thersday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  BarChart.fromMap(Map<String, dynamic> map)
      : monday = map['monday'] ?? 0.0,
        tuesday = map['tuesday'] ?? 0.0,
        wendnesday = map['wendnesday'] ?? 0.0,
        thersday = map['thersday'] ?? 0.0,
        friday = map['friday'] ?? 0.0,
        saturday = map['saturday'] ?? 0.0,
        sunday = map['sunday'] ?? 0.0;
}
