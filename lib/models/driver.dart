// ignore_for_file: public_member_api_docs, sort_constructors_first
class Driver {
  int id;
  String name;
  String email;
  String phone;
  Driver({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  Driver.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? -1,
        name = map['name'] ?? "",
        email = map['email'] ?? "",
        phone = map['phone'] ?? "";

  static List<Driver> fromList(List list) =>
      list.map((e) => Driver.fromMap(e)).toList();
}
