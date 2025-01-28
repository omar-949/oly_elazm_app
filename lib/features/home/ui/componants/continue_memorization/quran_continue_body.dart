import 'package:flutter/material.dart';
import 'quran_continue_background.dart';
import 'quran_continue_icon.dart';
import 'quran_progress_info.dart';
import 'quran_continue_progress_button.dart';
import 'verse_range_info.dart';

class QuranContinueBody extends StatelessWidget {
  final String name;
  final String num;
  final String startVerse;
  final String endVerse;
  final bool isInHome;
  const QuranContinueBody({
    super.key,
    required this.name,
    required this.num,
    this.startVerse = '12',
    this.endVerse = '14',
    this.isInHome = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const QuranContinueBackground(),
        const QuranContinueIcon(),
        QuranProgressInfo(name: name, num: num),
        if (isInHome)
          const QuranContinueProgressButton()
        else
          VerseRangeInfo(startVerse: startVerse, endVerse: endVerse),
      ],
    );
  }
}
