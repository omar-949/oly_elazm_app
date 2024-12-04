import 'package:flutter/material.dart';
import 'package:oly_elazm/features/onboarding/presentation/views/widgets/splash/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
