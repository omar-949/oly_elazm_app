import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'quran_title.dart';
import 'splash_image.dart';
import 'stars_image.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _startFadeAndNavigate();
  }

  void _startFadeAndNavigate() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          _isVisible = false;
        });
        Future.delayed(const Duration(milliseconds: 1500), () {
          navigateToHome(context);
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1500),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.goldToBrown,
        ),
        child: const Stack(
          children: [
            Positioned(
              top: 76,
              left: 21,
              child: StarsImage(),
            ),
            Positioned(top: 244, left: 95, child: QuranTitle()),
            Positioned(top: 348, child: SplashImage()),
          ],
        ),
      ),
    );
  }
}

void navigateToHome(final BuildContext ctx) {
  ctx.pushNamed(Routes.mainNav);
}
