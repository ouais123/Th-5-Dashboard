// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int id;
  String name;
  String email;
  String password;
  String role;
  String authToken;
  String cloudMessaging;
  String createdAt;
  String updatedAt;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.authToken,
    required this.cloudMessaging,
    required this.createdAt,
    required this.updatedAt,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? -1,
        name = map['name'] ?? "",
        email = map['emai'] ?? "",
        password = map['password'] ?? "",
        role = map['role'] ?? "",
        authToken = map['auth_token'] ?? "",
        cloudMessaging = map['cloud_messaging'] ?? "",
        createdAt = map['createdAt'] ?? "",
        updatedAt = map['updatedAt'] ?? "";
}
