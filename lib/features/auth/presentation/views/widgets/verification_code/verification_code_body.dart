import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/verification_code/resend_verification_code.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/verification_code/verification_code_form.dart';

class VerificationCodeBody extends StatelessWidget {
  const VerificationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          AuthHeader(
            title: 'رمز التحقق',
            description: 'أدخل الرمز الذي أرسلناه إلى رقمك 012345*****',
          ),
          VerificationCodeForm(),
          ResendVerificationCode(),
        ],
      ),
    );
  }
}

