import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_imgs.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';

class QuranContinueIcon extends StatelessWidget {
  const QuranContinueIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSize.h20,
      left: AppSize.w20,
      child: Image.asset(AppImages.quranIcon),
    );
  }
}
