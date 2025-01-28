import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/main_functions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/user_info/data/model/selector_model.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/chapters/chapters.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/country_and_lang.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/percent_bar.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/selector.dart';

class UserInfoBody extends StatelessWidget {
  const UserInfoBody({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInfoCubit, UserInfoState>(
      listener: (context, state) {},
      builder: (context, state) {
        final userInfoState = state is UserInfoUpdated
            ? state
            : UserInfoUpdated(isStudent: null, isMale: null, percent: 0.0);
        final widgets = [
          CountryAndLang(),
          Selector(
            optionModel: SelectionOption(
              title: 'هل أنت..؟',
              type: SelectionType.role,
              option1: 'طالب',
              option2: 'محفظ',
              image1: 'assets/images/male.png',
              image2: 'assets/images/female.png',
            ),
            onSelectionChanged: (value) {
              context.read<UserInfoCubit>().updateRole(value);
              context
                  .read<UserInfoCubit>()
                  .updateData(userType: value == true ? "student" : "teacher");
              log(userInfoState.userInfoModel!.userType.toString());

            },
          ),
          Selector(
            optionModel: SelectionOption(
              title: 'اختر نوعك',
              type: SelectionType.gender,
              option1: 'ذكر',
              option2: 'انثي',
              image1: 'assets/images/male.png',
              image2: 'assets/images/female.png',
            ),
            onSelectionChanged: (value) {
              context.read<UserInfoCubit>().updateGender(value);
              context
                  .read<UserInfoCubit>()
                  .updateData(gender: value == true ? "male" : "female");
              log(userInfoState.userInfoModel!.userType.toString());

            },
          ),
          if (userInfoState.isStudent == true) const Chapters(),
        ];

        bool isJobSelected() => userInfoState.userInfoModel?.job != null;
        bool isUserTypeSelected() =>
            userInfoState.userInfoModel?.userType != null;
        bool isGenderSelected() => userInfoState.userInfoModel?.gender != null;
        bool isPartNumberSelected() =>
            userInfoState.userInfoModel?.partNumber != null;
        bool isLastPage() => userInfoState.currentIndex >= widgets.length - 1;

        void showErrorToast(String message) {
          showToast(text: message, color: AppColors.errorColor);
        }

        void handleNextPage() {
          if (!isJobSelected() && userInfoState.currentIndex == 0) {
            showErrorToast("يجب تحديد المهنة");
          } else if (!isUserTypeSelected() && userInfoState.currentIndex == 1) {
            showErrorToast("يجب تحديد المستخدم");
          } else if (!isGenderSelected() && userInfoState.currentIndex == 2) {
            showErrorToast("يجب تحديد نوع المستخدم");
          } else if (userInfoState.currentIndex == 0 ||
              userInfoState.currentIndex < 3 &&
                  userInfoState.isStudent == true ||
              (userInfoState.currentIndex < 2 &&
                  userInfoState.isStudent == false)) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else if (!isPartNumberSelected() &&
              userInfoState.isStudent == true) {
            showErrorToast("يجب تحديد عدد اجزاء الحفظ");
          } else if (isLastPage()) {
            context.pushNamed(Routes.loginSignUpScreen,);
          }
        }

        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (userInfoState.currentIndex >= 1)
                Padding(
                  padding: EdgeInsets.only(top: 70.h, bottom: 24.h),
                  child: PercentBar(percent: userInfoState.percent),
                ),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widgets.length,
                  onPageChanged: (index) {
                    context.read<UserInfoCubit>().updateCurrentIndex(index);
                  },
                  itemBuilder: (context, index) => widgets[index],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h, right: 16.w, left: 16.w),
                child: CustomAppButton(
                  onTap: handleNextPage,
                  title: isLastPage() ? 'تم' : 'التالي',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
