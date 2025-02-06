import 'package:flutter/material.dart';
import 'package:oly_elazm/features/azkhar/ui/componants/azkar_counter_widget/azkar_counter_body.dart';

class AzkarCounterView extends StatelessWidget {
  const AzkarCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AzkarCounterBody()),
    );
  }
}
