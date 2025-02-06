import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';

import '../../../../../../core/widgets/app_button.dart';
import '../../../logic/home_cubit.dart';

class QuranContinueProgressButton extends StatelessWidget {
  const QuranContinueProgressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSize.h10,
      right: AppSize.w8,
      child: AppButton(
        title: 'متابعة الحفظ',
        onTap: () {
          context.pushNamed(Routes.todayMemorization,
              arguments:
                  context.read<HomeCubit>().state.assignedTaskModel);
        },
        background: AppColors.secondaryAppColor,
        fontSize: AppSize.sp16,
        radius: AppSize.r10,
        width: AppSize.w127,
        height: AppSize.h33,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
