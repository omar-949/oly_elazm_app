import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/students_progress/ui/componants/oval_bottom_clipper.dart';

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
