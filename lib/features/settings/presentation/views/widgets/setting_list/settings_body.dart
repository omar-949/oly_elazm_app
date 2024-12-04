import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/widgets/info_header_section.dart';
import 'item_list_view.dart';
import 'logout_button.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoHeaderSection(studentName: 'أحمد عمرو'),
        SizedBox(height: AppSize.h20),
        ItemListView(),
        30.verticalSpace,
        LogoutButton(),
        ],
    );
  }
}
