import 'package:dashboard/models/exception/app_exception.dart';

class UnAuthenticationException extends AppException {
  UnAuthenticationException({
    url,
    message,
  }) : super(
          url: url,
          message: "UnAuthentication Request",
        );
}
