import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

class QuranPageView extends StatelessWidget {
  const QuranPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Viewer'),
      ),
      body: PageView.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          int surahNumber = index + 1;
          String surahName = quran.getSurahNameArabic(surahNumber);
          int verseCount = quran.getVerseCount(surahNumber);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: verseCount,
              itemBuilder: (context, verseIndex) {
                String verseText = quran.getVerse(surahNumber, verseIndex + 1);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '${verseIndex + 1}: $verseText',
                    textAlign: TextAlign.justify,
                    style:  TextStyle(fontSize: 18, fontFamily: GoogleFonts.amiriQuran().fontFamily),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}