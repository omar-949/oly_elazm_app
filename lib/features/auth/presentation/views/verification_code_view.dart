import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/verification_code/verification_code_body.dart';

import '../../../../core/routing/routing_arguments.dart';
import 'widgets/app_back_button.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key, required this.verifyCode});
final VerifyCodeArguments verifyCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBackButton(),
        ],
      ),
      body: VerificationCodeBody(verificationCode:verifyCode,),
    );
  }
}
