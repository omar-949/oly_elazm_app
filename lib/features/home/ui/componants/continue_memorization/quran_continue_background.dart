import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_imgs.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
class QuranContinueBackground extends StatelessWidget {
  const QuranContinueBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.w342,
      height: AppSize.h156,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.r12),
        image: const DecorationImage(
          image: AssetImage(AppImages.continueBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
