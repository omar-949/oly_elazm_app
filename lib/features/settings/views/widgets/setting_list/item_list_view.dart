import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/features/settings/logic/setting_cubit.dart';
import 'package:oly_elazm/features/settings/logic/setting_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/helpers/app_strings.dart';
import '../../../../../../core/helpers/shared_prefrences.dart';
import 'custom_list_item.dart';
import 'expandable_item.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.w358,
      child: Column(
        children: [
          CustomListItem(
            icon: 'assets/svgs/tabler_edit.svg',
            label: 'تعديل الملف الشخصي',
            onTap: () {
              context.pushNamed(Routes.editProfileView,
                  arguments: context.read<SettingCubit>().state.profileModel);
            },
          ),
          if (SharedPrefHelper.getString(AppStrings.userRoleKey) ==
              "student") ...[
            Divider(),
            BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return Skeletonizer(
                  enabled: state.profileState.isLoading &&
                      state.profileModel == null,
                  child: ExpandableItem(
                    icon: 'assets/svgs/discord_boost.svg',
                    title: 'عدد النقاط',
                    pointsLabel: 'إجمالي النقاط: ',
                    pointsValue:
                        state.profileModel?.data?.totalPoints?.toString() ??
                            "0",
                  ),
                );
              },
            ),
            Divider(),
            CustomListItem(
              icon: 'assets/svgs/Verified_Person.svg',
              label: 'المُحفظ',
              onTap: () {
                context.pushNamed(Routes.elmohafezDetailsView,
                    arguments: context.read<SettingCubit>().state.profileModel);
              },
            ),
            Divider(),
          ]
        ],
      ),
    );
  }
}
