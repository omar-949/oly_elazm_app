import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/reset_password/reset_password_form.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              title: 'إعادة تعيين كلمة المرور',
              description: 'يرجى إدخال كلمة المرور الجديدة الخاصة بك، ثم تأكيدها. تأكد من أن كلمة المرور قوية وتتكون من 8 أحرف على الأقل.',
            ),
            ResetPasswordForm(),
          ],
        ),
      ),
    );
  }
}
