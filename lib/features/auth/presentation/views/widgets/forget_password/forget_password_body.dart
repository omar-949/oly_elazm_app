import 'package:flutter/material.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/forget_password/forget_password_form.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          AuthHeader(
            title: 'نسيت كلمة المرور؟',
            description:
                'أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك، وسنرسل لك رمز التأكيد',
          ),
          ForgetPasswordForm(),
        ],
      ),
    );
  }
}
