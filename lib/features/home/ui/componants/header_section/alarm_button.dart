import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlarmButton extends StatelessWidget {
  const AlarmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24.w,
      top: 50.h,
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svgs/alarm.svg'),
      ),
    );
  }
}
