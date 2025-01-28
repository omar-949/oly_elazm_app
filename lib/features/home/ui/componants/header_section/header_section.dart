import 'package:flutter/material.dart';
import 'alarm_button.dart';
import 'background_image.dart';
import 'info_row.dart';
import 'location_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        AlarmButton(),
        InfoRow(),
        LocationText(),
      ],
    );
  }
}




