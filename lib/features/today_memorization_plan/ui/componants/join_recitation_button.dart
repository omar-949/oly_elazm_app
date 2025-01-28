import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/font_weight_helper.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_button.dart';

class JoinRecitationButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const JoinRecitationButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: title,
      onTap: onTap,
      background: AppColors.secondaryAppColor,
      fontSize: AppSize.sp16,
      radius: AppSize.r34,
      width: AppSize.w358,
      height: AppSize.h45,
      fontWeight: FontWeightHelper.regular,
    );
  }
}
