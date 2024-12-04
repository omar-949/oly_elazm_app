import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/verification_code/code_pinput.dart';

class VerificationCodeForm extends StatefulWidget {
  const VerificationCodeForm({super.key});

  @override
  State<VerificationCodeForm> createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
  late final TextEditingController otpController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 36.h),
              child: CodePinPut(
                otpController: otpController,
                validator: (value) {
                  if (value == null) {
                    return "الرجاء إدخال رمز التحقق (OTP)!";
                  } else if (value.length < 6) {
                    return "يجب أن يتكون رمز التحقق من 6 أرقام على الأقل!";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            CustomAppButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.pushNamed(Routes.resetPasswordScreen);
                }
              },
              title: 'تحقق',
            ),
          ],
        ),
      ),
    );
  }
}
