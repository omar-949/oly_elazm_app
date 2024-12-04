import 'package:flutter/material.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class StudentNameAndPoints extends StatelessWidget {
  const StudentNameAndPoints({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'أحمد عمرو',
          style: AppTextStyle.font20SemiBold(),
        ),
        Text(
          'طالب',
          style: AppTextStyle.font16Medium(
            color: AppColors.grey,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'عدد النقاط: ',
                style: AppTextStyle.font14Regular(
                  color: AppColors.grey,
                ),
              ),
              TextSpan(
                text: '150 ',
                style: AppTextStyle.font14Medium(
                  color: AppColors.secondaryAppColor,
                ),
              ),
              TextSpan(
                text: 'نقطة',
                style: AppTextStyle.font16SemiBold(
                  color: AppColors.secondaryAppColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
