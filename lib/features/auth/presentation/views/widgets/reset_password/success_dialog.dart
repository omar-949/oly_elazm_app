import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: const Color(0xffF0F8FF),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 50.w,
                    color: AppColors.secondaryAppColor,
                  ),
                ),
              ),
            ),
            Text(
              'تم بنجاح',
              style: AppTextStyle.font24Bold(),
            ),
            12.verticalSpace,
            Text(
              'لقد تم إعادة تعيين كلمة المرور الخاصة بك بنجاح.',
              style: AppTextStyle.font16Regular(color: AppColors.grey),
              textAlign: TextAlign.center,
            ),
            16.verticalSpace,
            SizedBox(
              width: 185.w,
              child: CustomAppButton(
                onTap: () {},
                title: 'تسجيل الدخول',
              ),
            )
          ],
        ),
      ),
    );
  }
}
