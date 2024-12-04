import 'package:flutter/material.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int currentPage;
  final int itemCount;

  const OnboardingPageIndicator(
      {super.key, required this.currentPage, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: currentPage,
      count: itemCount,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColors.secondaryAppColor,
        dotColor: Colors.white,
        dotHeight: 12,
        dotWidth: 16,
        spacing: 8,
      ),
    );
  }
}
