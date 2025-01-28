import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/verification_code/resend_verification_code.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/verification_code/verification_code_form.dart';

import '../../../../../../core/routing/routing_arguments.dart';

class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({super.key, required this.verificationCode});
final VerifyCodeArguments verificationCode ;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          AuthHeader(
            title: 'رمز التحقق',
            description: 'أدخل الرمز الذي تم ارساله لك',
          ),
          VerificationCodeForm(verifyCode:verificationCode,),
          ResendVerificationCode(),
        ],
      ),
    );
  }
}

