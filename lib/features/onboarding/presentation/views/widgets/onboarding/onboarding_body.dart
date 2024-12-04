import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_imgs.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/features/onboarding/data/models/onboarding_item.dart';
import 'package:oly_elazm/features/onboarding/presentation/views/widgets/onboarding/onboarding_overlay.dart';
import 'package:oly_elazm/features/onboarding/presentation/views/widgets/onboarding/onboarding_page_content.dart';
import 'package:oly_elazm/features/onboarding/presentation/views/widgets/onboarding/onboarding_page_indicator.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final List<OnboardingItem> items = [
    OnboardingItem(
      title: 'مرحباً!',
      description: 'ابدأ رحلتك في حفظ القرآن بسهولة وبالوتيرة التي تناسبك.',
      image: AppImages.onboarding1,
    ),
    OnboardingItem(
      title: 'خطط مخصصة',
      description: 'ضع أهدافك الخاصة وتلقَّ تذكيرات مخصصة لتبقى على المسار.',
      image: AppImages.onboarding2,
    ),
    OnboardingItem(
      title: 'حافظ على التحفيز',
      description: 'استلم تذكيرات يومية وآيات ملهمة تبقيك متصلاً بالقرآن.',
      image: AppImages.onboarding3,
    ),
  ];

  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: items.length,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            final item = items[index];
            return OnboardingPageContent(
              item: item,
            );
          },
        ),
        OnboardingOverlay(
          currentPage: currentPage,
          items: items,
          onSkip: () => context.pushReplacementNamed(Routes.userInfo),
          onContinue: () {
            if (currentPage < items.length - 1) {
              _navigateToPage(currentPage + 1);
            } else {
              context.pushReplacementNamed(Routes.userInfo);
            }
          },
        ),
        Positioned(
          bottom: 60,
          child: OnboardingPageIndicator(
            currentPage: currentPage,
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
