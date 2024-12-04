import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/user_info/data/model/selector_model.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/chapters/chapters.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/country_and_lang.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/percent_bar.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/selector.dart';

class UserInfoBody extends StatelessWidget {
  const UserInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        final PageController pageController = PageController();

        final userInfoState = state is UserInfoUpdated
            ? state
            : UserInfoUpdated(isStudent: null, isMale: null, percent: 0.0);
        List<Widget> widgets = [
          const CountryAndLang(),
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
            },
          ),
          if (userInfoState.isStudent == true) const Chapters(),
        ];

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
                  itemCount: widgets.length,
                  onPageChanged: (index) {
                    context.read<UserInfoCubit>().updateCurrentIndex(index);
                  },
                  itemBuilder: (context, index) {
                    return widgets[index];
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h, right: 16.w, left: 16.w),
                child: CustomAppButton(
                  onTap: () {
                    if (userInfoState.currentIndex < widgets.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                    if (state is UserInfoUpdated && state.percent == 1.0) {
                      context.pushNamed(Routes.loginSignUpScreen);
                    }
                  },
                  title: userInfoState.currentIndex < widgets.length - 1 ? 'التالي' : 'تم',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
