import 'package:flutter/material.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/logo_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'خيارات تسجيل الدخول الأخرى',
          style: AppTextStyle.font14Regular(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoButton(
              icon: 'assets/svgs/apple.svg',
              onTap: () {},
            ),
            LogoButton(
              icon: 'assets/svgs/google.svg',
              onTap: () {},
            ),
            LogoButton(
              icon: 'assets/svgs/facebook.svg',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
