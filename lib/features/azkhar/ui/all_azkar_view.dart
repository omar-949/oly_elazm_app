import 'package:flutter/material.dart';

import 'componants/all_azkar_widgets/all_azkar_body.dart';

class AllAzkarView extends StatelessWidget {
  const AllAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AllAzkarBody(),
      ),
    );
  }
}
