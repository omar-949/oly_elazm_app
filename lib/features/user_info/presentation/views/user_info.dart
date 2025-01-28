import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';
import 'package:oly_elazm/features/user_info/presentation/views/widgets/user_info_body.dart';

class UserPreferences extends StatelessWidget {
  const UserPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        leading:
          BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              if (state is UserInfoUpdated) {
                if (state.currentIndex != 0) {
                  return IconButton(
                    onPressed: () {
                      pageController.jumpToPage(state.currentIndex-1);
                      context.read<UserInfoCubit>().updateCurrentIndex(state.currentIndex-1);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.mainAppColor,),
                  );
                }
              }
              return SizedBox.shrink(); // Return an empty widget instead of null
            },
          ),

      ),
      body: UserInfoBody(pageController: pageController,),
    );
  }
}
