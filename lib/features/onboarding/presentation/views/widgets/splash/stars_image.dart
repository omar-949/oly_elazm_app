import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarsImage extends StatelessWidget {
  const StarsImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 347.w,
      height: 136.h,
      child: SvgPicture.asset(
        "assets/svgs/stars.svg",
        fit: BoxFit.cover,
      ),
    );
  }
}