import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StepperIcons extends StatelessWidget {
  const StepperIcons({
    super.key,
    required this.index,
    required this.totalSteps,
  });

  final int index;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final List<String> svgs = [
      'assets/svgs/sun rise.svg',
      'assets/svgs/sunny.svg',
      'assets/svgs/sun fall.svg',
      'assets/svgs/moon rise.svg',
      'assets/svgs/moon.svg',
    ];
    return Row(
      children: [
        SvgPicture.asset(
          svgs[index],
        ),
        if (index < totalSteps - 1)
          Container(
            width: 55.w,
            color: Colors.transparent,
          ),
      ],
    );
  }
}
