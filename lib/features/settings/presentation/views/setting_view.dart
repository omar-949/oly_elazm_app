import 'package:flutter/material.dart';
import 'package:oly_elazm/core/widgets/app_bar.dart';
import 'widgets/setting_list/settings_body.dart';
class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الاعدادات'),
      body: SettingsBody(),
    );
  }
}
