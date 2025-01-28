import 'package:fluttertoast/fluttertoast.dart';

import 'globals.dart';

Future<void> recitate(String recitation) async =>
    recitator.setUrl(recitation);

void show(String text) => Fluttertoast.showToast(
    msg: text, fontSize: 16, toastLength: Toast.LENGTH_LONG);

// Future<bool> load() async {
//   try {
//     Hive.init((await getApplicationDocumentsDirectory()).path);
//     userData = await Hive.openBox("userData");
//     if (userData!.isEmpty) {
//       await userData!.putAll(<String, dynamic>{
//         "first_time": true,
//         "name": "User",
//         "last_verse": 0,
//         "last_surah": 0,
//         "recitations": <String>[]
//       });
//     }
//     return true;
//   } catch (e) {
//     show(e.toString());
//     return false;
//   }
// }
