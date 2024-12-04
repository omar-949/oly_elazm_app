import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../networking/app_exceptions.dart';
import '../networking/dio.dart';

/// custom api call function ///
Future<Either<Failure, T>> makeApiCall<T>({
  required String method,
  required String url,
  Map<String, dynamic>? params,
  dynamic data,
  required T Function(dynamic) fromJson,
  Function(Response?)? errorHandler,
  successHandler,
}) async {
  try {
    Response? response;
    if (method == 'GET') {
      response = await DioHelper.getData(url: url, params: params);
    } else if (method == 'POST') {
      response = await DioHelper.postData(url: url, params: params, data: data);
    } else if (method == 'DELETE') {
      response = await DioHelper.deleteData(url: url, data: data);
    } else if (method == 'PATCH') {
      response = await DioHelper.patchData(url: url, data: data);
    } else {
      throw UnimplementedError('Method $method is not implemented');
    }

    if (response != null && response.statusCode == 200) {
      log(response.data.toString());
      if (successHandler != null) {
        successHandler(response);
      }
      final responseData = fromJson(response.data);
      return Right(responseData);
    } else {
      log(response!.data.toString());
      if (errorHandler != null) {
        errorHandler(response);
      }
      return Left(ServerFailure(response.statusCode.toString()));
    }
  } catch (e) {
    log(e.toString());
    return Left(ServerFailure(e.toString()));
  }
}

/// Show Alert Dialog ///
customAlertDialog({
  required BuildContext context,
  required Widget content,
  bool? barrierDismissible,
  double? marginHPadding,
  radius,
  duration,
  hPadding,
  vPadding,
  width,
}) {
  showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius ?? 20.r),
                    color: Colors.white),
                padding: EdgeInsets.symmetric(
                    horizontal: hPadding ?? 0.0, vertical: vPadding ?? 0.0),
                margin: EdgeInsets.symmetric(horizontal: marginHPadding ?? 0.0),
                child: content,
              ),
            ],
          ));
}

/// show toast message //
showToast({required String text, int? time, required Color color}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: time ?? 6,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
