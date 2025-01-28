import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';

class LoginSignUpTabBar extends StatelessWidget {
  const LoginSignUpTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          return TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
            ),
            indicatorPadding: EdgeInsets.symmetric(
              vertical: 6.h,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            onTap: (value) {
              if (value == 1 &&
                  state is UserInfoUpdated &&
                  state.userInfoModel!.job == null) {
                context.pushNamed(Routes.userInfo);
              }
            },
            labelColor: AppColors.secondaryAppColor,
            labelStyle: AppTextStyle.font18SemiBold(),
            unselectedLabelStyle: AppTextStyle.font18Medium(),
            unselectedLabelColor: Colors.black,
            tabAlignment: TabAlignment.fill,
            tabs: const [
              Tab(
                text: 'تسجيل الدخول',
              ),
              Tab(
                text: 'إنشاء حساب',
              ),
            ],
          );
        },
      ),
    );
  }
}
