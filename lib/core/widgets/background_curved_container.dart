import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/students_progress/oval_bottom_clipper.dart';

class BackgroundCurvedContainer extends StatelessWidget {
  const BackgroundCurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomClipper(),
      child: Container(
        height: 120.h,
        color: const Color(0xffFFD08A),
      ),
    );
  }
}
