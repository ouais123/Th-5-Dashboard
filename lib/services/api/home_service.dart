import 'dart:convert';

import 'package:dashboard/core/constants/strings.dart';
import 'package:dashboard/models/complaints.dart';
import 'package:dashboard/models/driver.dart';
import 'package:dashboard/models/exception/app_exception.dart';
import 'package:dashboard/models/exception/bad_request_exception.dart';
import 'package:dashboard/models/exception/unauthorized_exception.dart';
import 'package:dashboard/models/overview.dart';
import 'package:dashboard/services/app/setting_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class HomeService {
  final SettingService settingServices = Get.find();
  late dio.Dio _dio;
  HomeService() {
    dio.BaseOptions baseOptions = dio.BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio = dio.Dio(baseOptions);
  }

  Future<bool?> addPrice(double price) async {
    Map<String, dynamic> body = {
      "priceByKilo": price,
    };

    String tagUrl = "admin/add/pricing";
    String url = baseUrl + tagUrl;

    try {
      dio.Response response = await _dio.post(
        tagUrl,
        data: json.encode(body),
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": settingServices.getToken(),
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
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

  Future<OverView?> getOverView() async {
    String tagUrl = "admin/all";
    String url = baseUrl + tagUrl;

    try {
      dio.Response response = await _dio.get(
        tagUrl,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": settingServices.getToken(),
          },
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> bodyRes = response.data;
        return OverView.formMap(bodyRes);
      }
    } on dio.DioError catch (e) {
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
    } catch (e) {
      throw AppException(
        url: url,
        message: "Error occurred".tr,
      );
    }
    return null;
  }

  Future<List<Complaints>?> getComplaints() async {
    String tagUrl = "complaint";
    String url = baseUrl + tagUrl;

    try {
      dio.Response response = await _dio.get(
        tagUrl,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": settingServices.getToken(),
          },
        ),
      );

      if (response.statusCode == 200) {
        List bodyRes = response.data ?? [];
        return Complaints.fromList(bodyRes);
      }
    } on dio.DioError catch (e) {
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
    } catch (e) {
      throw AppException(
        url: url,
        message: "Error occurred".tr,
      );
    }
    return null;
  }

  Future<List<Driver>?> getDrivers() async {
    String tagUrl = "admin/get-drivers";
    String url = baseUrl + tagUrl;

    try {
      dio.Response response = await _dio.get(
        tagUrl,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": settingServices.getToken(),
          },
        ),
      );

      if (response.statusCode == 200) {
        List bodyRes = response.data ?? [];
        return Driver.fromList(bodyRes);
      }
    } on dio.DioError catch (e) {
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
    } catch (e) {
      throw AppException(
        url: url,
        message: "Error occurred".tr,
      );
    }
    return null;
  }

  Future<Driver?> acceptDriver(int driverId) async {
    Map<String, dynamic> body = {
      "is_accept": true,
    };

    String tagUrl = "admin/accept-driver/$driverId";
    String url = baseUrl + tagUrl;

    try {
      dio.Response response = await _dio.post(
        tagUrl,
        data: json.encode(body),
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": settingServices.getToken(),
          },
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> bodyRes = response.data;
        return Driver.fromMap(bodyRes);
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

  Future<bool?> deleteDriver(int driverId) async {
    String tagUrl = "admin/$driverId";
    String url = baseUrl + tagUrl;

    try {
      dio.Response response = await _dio.delete(
        tagUrl,
        options: dio.Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": settingServices.getToken(),
          },
        ),
      );

      if (response.statusCode == 204) {
        return true;
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
