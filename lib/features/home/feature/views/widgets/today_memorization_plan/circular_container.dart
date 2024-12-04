import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class CircularContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  const CircularContainer({
    super.key,
    required this.text,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.r94,
      height: AppSize.r90,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.45),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyle.font50Regular(
          color: AppColors.white,
        ).copyWith(
          shadows: [
            Shadow(
              color: AppColors.white.withOpacity(0.45),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}
