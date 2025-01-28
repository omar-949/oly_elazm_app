import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
class ReminderTextWidget extends StatelessWidget {
  const ReminderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSize.h30,
        left: AppSize.w61,
        right: AppSize.w61,
      ),
      child: Text(
        'حان موعد التسميع, المُحفظ بإنتظارك',
        style: AppTextStyle.font20Medium(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
