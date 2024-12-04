import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/app_back_button.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/forget_password/forget_password_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          AppBackButton(),
        ],
      ),
      body: ForgetPasswordBody(),
    );
  }
}
