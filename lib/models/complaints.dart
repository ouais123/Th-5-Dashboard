class Complaints {
  final int id;
  final int driverId;
  final String driverName;
  final int userId;
  final String userName;
  final String content;
  Complaints({
    required this.id,
    required this.driverId,
    required this.driverName,
    required this.userId,
    required this.userName,
    required this.content,
  });

  Complaints.formMap(Map<String, dynamic> map)
      : id = map['id'] ?? -1,
        driverId = map['driver.id'] ?? -1,
        driverName = map['driver.name'] ?? "",
        userId = map['user.id'] ?? -1,
        userName = map['user.name'] ?? "",
        content = map['title'] ?? "";

  static List<Complaints> fromList(List list) =>
      list.map((e) => Complaints.formMap(e)).toList();
}
