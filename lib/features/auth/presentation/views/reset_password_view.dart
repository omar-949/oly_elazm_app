import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/app_back_button.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/reset_password/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          AppBackButton(),
        ],
      ),
      body: ResetPasswordBody(),
    );
  }
}
