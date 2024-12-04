import 'package:flutter/material.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_bar.dart';
import 'package:oly_elazm/features/settings/presentation/views/widgets/edit_profile/edit_profile_body.dart';
class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تعديل الملف  الشخصي',backgroundColor: AppColors.white,),
      body: EditProfileBody(),
    );
  }
}
