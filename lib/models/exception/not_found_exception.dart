import 'package:dashboard/models/exception/app_exception.dart';

class NotFoundException extends AppException {
  NotFoundException({
    url,
    message,
  }) : super(
          url: url,
          message: "Not Found",
        );
}
