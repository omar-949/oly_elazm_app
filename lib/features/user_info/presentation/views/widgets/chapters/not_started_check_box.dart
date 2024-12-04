import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';

class NotStartedCheckbox extends StatelessWidget {
  const NotStartedCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        final userInfoState = state as UserInfoUpdated;
        bool isChecked = userInfoState.notStarted;

        return Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                context.read<UserInfoCubit>().toggleChapterSelection(value ?? false);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              side: const BorderSide(
                color: Color(0xff777777),
              ),
              activeColor: AppColors.secondaryAppColor,
              splashRadius: 0,
            ),
            Text(
              'لم تبدأ الحفظ بعد؟',
              style: AppTextStyle.font16Regular(color: const Color(0xff5F5F5F)),
            ),
          ],
        );
      },
    );
  }
}
