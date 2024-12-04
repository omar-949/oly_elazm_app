import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';

class CircleImage extends StatelessWidget {
  final String? imagePath;

  const CircleImage({
    super.key,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: AppColors.secondaryAppColor,
      child: ClipOval(
        child: Image.asset(
          imagePath ?? 'assets/images/male.png',
          fit: BoxFit.cover,
          width: 96.r,
          height: 96.r,
        ),
      ),
    );
  }
}
