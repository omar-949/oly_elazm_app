import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import '../../../../../../core/helpers/app_size.dart';
import 'join_recitation_button.dart';
import 'reminder_text_widget.dart';
import 'time_indicator_widget.dart';

class RecitationTimeSection extends StatelessWidget {
  const RecitationTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // const StackTime(),
        const TimeIndicatorWidget(),
        const ReminderTextWidget(),
        AppSize.h20.ph,
        JoinRecitationButton(
          title: 'رابط التسميع',
          onTap: () {},
        ),
      ],
    );
  }
}
