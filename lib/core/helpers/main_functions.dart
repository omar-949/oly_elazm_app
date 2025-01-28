import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

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
                child: Material(child: content),
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

/// location permission request //
Future<bool> requestPermission(Permission permission) async {
  if (await permission.isGranted) {
    return true;
  } else {
    var result = await permission.request();
    return result == PermissionStatus.granted;
  }
}