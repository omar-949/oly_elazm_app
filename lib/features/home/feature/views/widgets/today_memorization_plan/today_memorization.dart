import 'package:flutter/material.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/today_memorization_plan/today_memorization_body.dart';

import 'today_memorization_app_bar.dart';
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
