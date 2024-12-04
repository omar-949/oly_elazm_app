import 'package:flutter/material.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/header_section/alarm_button.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/header_section/background_image.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/header_section/info_row.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/header_section/location_text.dart';

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




