import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/main_functions.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_button_loading.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/settings/logic/setting_cubit.dart';

import '../../../../../core/routing/named_router.dart';
import '../../../logic/setting_state.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        150.horizontalSpace,
        BlocConsumer<SettingCubit, SettingState>(
          listener: (context, state) {
            if (state.logOutState.isSuccess) {
              showToast(
                  text: 'تم تسجيل الخروج بنجاح', color: AppColors.successColor);
              context.pushNamedAndRemoveUntil(
                Routes.loginSignUpScreen,
                predicate: (route) => false,
              );
            }
          },
          builder: (context, state) {
            return state.logOutState.isLoading
                ? AppButtonLoading(
                    title: 'تسجيل الخروج',
              width: 195.w,
                  )
                : CustomAppButton(
                    onTap: () {
                      context.read<SettingCubit>().logout();
                    },
                    title: 'تسجيل الخروج',
                    width: 195.w,
                    height: 46.h,
                    isRadial: true,
                    gradientColors: AppColors.radialOverlay,
                  );
          },
        ),
      ],
    );
  }
}
