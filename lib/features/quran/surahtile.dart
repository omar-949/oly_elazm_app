import 'package:flutter/material.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/features/quran/sixteensth_star.dart';
import 'package:oly_elazm/features/quran/surah.dart';
import 'package:oly_elazm/features/quran/utils/globals.dart';
import 'package:oly_elazm/features/quran/utils/helpers/custom_play_pause.dart';
import 'package:oly_elazm/features/quran/utils/helpers/custom_text.dart';
import 'package:quran/quran.dart' as quran;

class SurahTile extends StatelessWidget {
  const SurahTile({super.key, required this.number});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        highlightColor: transparent,
        focusColor: transparent,
        hoverColor: transparent,
        splashColor: transparent,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Surah(surah: number))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                SixteenSideStar(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomizedText(
                        text: number.toString(),
                        color: AppColors.mainAppColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                    Container(width: 20, height: 1, color: purple),
                    CustomizedText(
                        text: number
                            .toString()
                            .split('')
                            .map((String e) => arabicNumbers[e])
                            .join(),
                        color: AppColors.mainAppColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomizedText(
                    text: quran.getSurahNameArabic(number),
                    color: AppColors.mainAppColor,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 5),
                CustomizedText(
                    color: AppColors.mainAppColor,
                    text:
                        "${quran.getPlaceOfRevelation(number).toUpperCase()=="MAKKAH"?"مكية":"مدنية"} - ${quran.getVerseCount(number)} آية",
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ],
            ),
            const Spacer(),
            PlayPause(index: number, surah: number,isSurah:true,),

          ],
        ),
      ),
    );
  }
}
