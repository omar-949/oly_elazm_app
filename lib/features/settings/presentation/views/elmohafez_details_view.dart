import 'package:flutter/material.dart';
import 'package:oly_elazm/core/widgets/app_bar.dart';
import 'package:oly_elazm/features/settings/presentation/views/widgets/elmohafez/elmohafez_details_body.dart';
class ElmohafezDetailsView extends StatelessWidget {
  const ElmohafezDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'المُحفظ'),
      body: ElmohafezDetailsBody(),
    );
  }
}
