import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran/quran.dart' as quran;

import '../callbacks.dart';
import '../globals.dart';

class PlayPause extends StatefulWidget {
  const PlayPause({super.key, required this.index, required this.surah, this.isSurah = false});
  final int index; // Index of the verse or the starting point
  final int surah; // Surah number
  final bool isSurah; // Indicates whether to play the entire surah or a single verse

  @override
  State<PlayPause> createState() => _PlayPauseState();
}

class _PlayPauseState extends State<PlayPause> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: transparent,
      hoverColor: transparent,
      highlightColor: transparent,
      onTap: () async {
        if (widget.isSurah) {
          // Play entire surah
          log("Playing entire surah ${widget.surah}");
          setState(() => _isPlaying = !_isPlaying);
          if (_isPlaying) {
            await recitate(quran.getAudioURLBySurah(widget.surah));
            await recitator.play();
            setState(() => _isPlaying = false); // Reset state after surah finishes
          } else {
            await recitator.stop();
          }
        } else {
          // Play single verse
          log("Playing verse ${widget.index + 1} of surah ${widget.surah}");
          setState(() => _isPlaying = !_isPlaying);
          if (_isPlaying) {
            await recitate(quran.getAudioURLByVerse(widget.surah, widget.index + 1));
            await recitator.play();
            setState(() => _isPlaying = false);
          } else {
            await recitator.stop();
          }
        }
      },
      child: Icon(
        _isPlaying ? FontAwesomeIcons.stop : FontAwesomeIcons.play,
        size: 20,
        color: purple,
      ),
    );
  }
}
