import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/login_form.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/sign_up_form.dart';

class LoginSignUpTabBarView extends StatelessWidget {
  const LoginSignUpTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        LoginForm(),
        SignUpForm(),
      ],
    );
  }
}
