import 'package:dashboard/models/exception/app_exception.dart';

class BadRequestException extends AppException {
  BadRequestException({
    url,
    message,
    data,
  }) : super(
          url: url,
          message: "Not Found",
        );
}
