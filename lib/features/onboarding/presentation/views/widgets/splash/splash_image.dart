import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 410.w,
      height: 550.h,
      child: SvgPicture.asset(
        "assets/svgs/masged.svg",
        fit: BoxFit.cover,
      ),
    );
  }
}