import 'package:dashboard/models/exception/app_exception.dart';

class UnAuthorizedException extends AppException {
  UnAuthorizedException({
    url,
    message,
  }) : super(
          url: url,
          message: "UnAuthorized Request",
        );
}
