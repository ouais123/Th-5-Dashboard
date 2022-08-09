import 'dart:convert';

import 'package:dashboard/core/constants/strings.dart';
import 'package:dashboard/models/exception/app_exception.dart';
import 'package:dashboard/models/exception/bad_request_exception.dart';
import 'package:dashboard/models/exception/unauthorized_exception.dart';
import 'package:dashboard/models/user.dart';
import 'package:dashboard/services/app/setting_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class AuthService {
  final SettingService settingServices = Get.find();
  late dio.Dio _dio;
  AuthService() {
    dio.BaseOptions baseOptions = dio.BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio = dio.Dio(baseOptions);
  }
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };

    String tagUrl = "admin/auth/login";
    String url = baseUrl + tagUrl;

    try {
      dio.Response response = await _dio.post(
        tagUrl,
        data: json.encode(body),
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> bodyRes = response.data;
        User user = User.fromMap(bodyRes['admin'] ?? {});
        settingServices.setToken(bodyRes['token']);
        return user;
      }
    } on dio.DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        throw BadRequestException(
          url: url,
          message: "Bad Request Exceptiohn",
        );
      }

      if (e.response != null && e.response!.statusCode == 401) {
        throw UnAuthorizedException(
          url: url,
          message: "Wrong email or password, check them".tr,
        );
      }

      if (e.type == dio.DioErrorType.connectTimeout)
        throw AppException(
          url: url,
          message: "Timed out for request".tr,
        );

      if (e.message.contains("SocketException"))
        throw AppException(
          url: url,
          message: "No internet connection".tr,
        );

      throw AppException(
        url: url,
        message: "Error connection occured".tr,
      );
    } on TypeError catch (_) {
      throw AppException(
        url: url,
        message: "Problem retrieving data, contact with admin".tr,
      );
    } catch (_) {
      throw AppException(
        url: url,
        message: "Error occurred".tr,
      );
    }
    return null;
  }
}
