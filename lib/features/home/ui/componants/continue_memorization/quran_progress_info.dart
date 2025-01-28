import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';

class QuranProgressInfo extends StatelessWidget {
  final String name;
  final String num;

  const QuranProgressInfo({super.key, required this.name, required this.num});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppSize.h20,
      right: AppSize.w15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'متابعة القرآن من حيث توقفت',
            style: AppTextStyle.font16Regular(color: Colors.white),
          ),
          5.ph,
          _buildRow('توقفت عند سورة ', name),
          5.ph,
          _buildRow('صفحة ', num),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyle.font16Regular(color: Colors.white),
        ),
        Text(
          value,
          style: AppTextStyle.font16Regular(color: AppColors.secondaryAppColor),
        ),
      ],
    );
  }
}
