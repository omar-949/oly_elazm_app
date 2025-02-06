import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/circle_image.dart';
import 'package:oly_elazm/features/settings/logic/setting_cubit.dart';
import 'package:oly_elazm/features/settings/logic/setting_state.dart';
import 'package:oly_elazm/features/settings/views/widgets/edit_profile/edit_profile_form.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            15.ph,
            BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CircleImage(
                      imagePath:state.profileModel?.data?.photoUrl ?? "_",
                    ),
                    15.ph,
                    Text(
                      state.profileModel?.data?.name ?? "_",
                      style: AppTextStyle.font20SemiBold(),
                    ),
                  ],
                );
              },
            ),
            EditProfileForm(),
          ],
        ),
      ),
    );
  }
}
