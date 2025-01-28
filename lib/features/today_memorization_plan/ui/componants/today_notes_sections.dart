import 'package:flutter/material.dart';
import 'note_card.dart';

class TodayNotesSections extends StatelessWidget {
  final String note;
  const TodayNotesSections({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NoteCard(note: note),
      ],
    );
  }
}
