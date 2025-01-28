import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'circular_container.dart';

class TimeRow extends StatelessWidget {
  final String hours;
  final String minutes;
  const TimeRow({super.key, required this.hours, required this.minutes});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularContainer(
          text: minutes,
          backgroundColor: AppColors.darkSlate,
        ),
        SvgPicture.asset(
          'assets/svgs/dots.svg',
          fit: BoxFit.cover,
        ),
        CircularContainer(
          text: hours,
          backgroundColor: AppColors.darkSlate,
        ),
      ],
    );
  }
}
