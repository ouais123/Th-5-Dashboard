// ignore_for_file: public_member_api_docs, sort_constructors_first
class LineChart {
  final int monday;
  final int tuesday;
  final int wendnesday;
  final int thersday;
  final int friday;
  final int saturday;
  final int sunday;
  LineChart({
    required this.monday,
    required this.tuesday,
    required this.wendnesday,
    required this.thersday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  LineChart.fromMap(Map<String, dynamic> map)
      : monday = map['monday'] ?? 0,
        tuesday = map['tuesday'] ?? 0,
        wendnesday = map['wendnesday'] ?? 0,
        thersday = map['thersday'] ?? 0,
        friday = map['friday'] ?? 0,
        saturday = map['saturday'] ?? 0,
        sunday = map['sunday'] ?? 0;
}
