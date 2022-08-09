import 'package:dashboard/models/exception/app_exception.dart';

class UnVaildInputException extends AppException {
  List<String> email;
  List<String> password;
  UnVaildInputException({
    url,
    message,
    required this.email,
    required this.password,
  }) : super(
          url: url,
          message: "Un Vaild Input",
        );
}
