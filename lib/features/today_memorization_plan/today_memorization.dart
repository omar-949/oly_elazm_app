import 'package:flutter/material.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/today_memorization_app_bar.dart';
import 'package:oly_elazm/features/today_memorization_plan/ui/componants/today_memorization_body.dart';

class TodayMemorization extends StatelessWidget {
  const TodayMemorization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodayMemorizationAppBar(),
      body: TodayMemorizationBody(),
    );
  }
}
