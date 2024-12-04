import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../helpers/app_strings.dart';
import '../helpers/shared_prefrences.dart';
import 'app_constants.dart';
import 'app_exceptions.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ));
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    );
  }

  /// Get FUNCTION ///
  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? params,
  }) async {
    try {
      dio.options.headers = {
        'Authorization':
            'Bearer ${await SharedPrefHelper.getSecuredString(AppStrings.userTokenKey)}',
      };
      return await dio.get(url, queryParameters: params);
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioException catch (e) {
      return e.response;

    }
  }

  /// POST FUNCTION ///
  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? params,
    required dynamic data,
  }) async {
    try {
      return await dio.post(url,
          data: data,
          queryParameters: params,
          options: Options(
              followRedirects: false,
              //Will Not Throw Errors
              validateStatus: (status) => true,
              headers: {
                'Authorization':
                    'Bearer ${await SharedPrefHelper.getSecuredString(AppStrings.userTokenKey)}',
              }));
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioException catch (e) {
            return e.response;

    }
  }

  /// DELETE FUNCTION ///
  static Future<Response?> deleteData({
    required String url,
    required dynamic data,
  }) async {
    try {
      return await dio.delete(url,
          data: data,
          options: Options(
              followRedirects: false,
              //Will Not Throw Errors
              validateStatus: (status) => true,
              headers: {
                'Authorization':
                    'Bearer ${await SharedPrefHelper.getSecuredString(AppStrings.userTokenKey)}',
              }));
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioException catch (e) {
            return e.response;

    }
  }

  /// PATCH FUNCTION ///
  /// Get Function ///
  static Future<Response?> patchData({
    required String url,
    required dynamic data,
  }) async {
    try {
      dio.options.headers = {
        'Authorization':
            'Bearer ${await SharedPrefHelper.getSecuredString(AppStrings.userTokenKey)}',
      };
      return await dio.patch(
        url,
        data: data,
      );
    } on SocketException {
      throw AppExceptions('Problem with internet connection.');
    } on HandshakeException {
      throw AppExceptions('Your have a problem in internet connection');
    } on TimeoutException {
      throw AppExceptions('Problem with internet connection.');
    } on DioException catch (e) {
            return e.response;

    }
  }
}
