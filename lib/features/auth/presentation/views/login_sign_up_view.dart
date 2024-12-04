import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/login_sign_up_body.dart';

class LoginSignUpView extends StatelessWidget {
  const LoginSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const LoginSignUpBody(),
        ),
      ),
    );
  }
}
