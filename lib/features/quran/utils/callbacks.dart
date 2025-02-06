import 'package:fluttertoast/fluttertoast.dart';

import 'globals.dart';

Future<void> recitate(String recitation) async =>
    recitator.setUrl(recitation);

void show(String text) => Fluttertoast.showToast(
    msg: text, fontSize: 16, toastLength: Toast.LENGTH_LONG);

