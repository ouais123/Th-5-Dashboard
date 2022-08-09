class AppException implements Exception {
  String url;
  String message;
  dynamic data;
  AppException({
    required this.url,
    required this.message,
    this.data,
  });
}
