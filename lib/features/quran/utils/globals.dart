import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';

const Color grey = Color.fromARGB(255, 40, 44, 52);
const Color white = Color.fromARGB(255, 215, 218, 224);
 Color purple = AppColors.mainAppColor;
const Color transparent = Colors.transparent;

final  recitator = AudioPlayer();


const Map<String, String> arabicNumbers = <String, String>{
  "0": "٠",
  "1": "۱",
  "2": "۲",
  "3": "۳",
  "4": "٤",
  "5": "٥",
  "6": "٦",
  "7": "۷",
  "8": "۸",
  "9": "۹"
};
