import 'package:flutter/material.dart';

import '../../../../../../core/helpers/app_size.dart';
import 'background_svg.dart';
import 'time_row.dart';
class TimeIndicatorWidget extends StatelessWidget {
  const TimeIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundSvg(assetPath: 'assets/svgs/Group.svg'),
        Positioned(
          top: AppSize.h15,
          left: AppSize.w15,
          right: AppSize.w15,
          child: const TimeRow(
            hours: '12',
            minutes: '10',
          ),
        ),
      ],
    );
  }
}
