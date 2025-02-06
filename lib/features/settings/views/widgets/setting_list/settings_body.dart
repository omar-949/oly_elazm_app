import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/core/widgets/info_header_section.dart';
import 'package:oly_elazm/features/settings/logic/setting_cubit.dart';
import 'package:oly_elazm/features/settings/logic/setting_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helpers/app_strings.dart';
import 'item_list_view.dart';
import 'logout_button.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled:
                  state.profileState.isLoading && state.profileModel == null,
              child: InfoHeaderSection(
                studentName: state.profileModel?.data?.name ?? "_",
                imagePath: state.profileModel?.data?.photoUrl ?? "_",
                userType: SharedPrefHelper.getString(AppStrings.userRoleKey),
              ),
            );
          },
        ),
        AppSize.h20.ph,
        ItemListView(),
        AppSize.h30.ph,
        LogoutButton(),
      ],
    );
  }
}
