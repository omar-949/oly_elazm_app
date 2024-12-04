import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/reset_password/success_dialog.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppFormItem(
              title: 'كلمة المرور',
              hint: 'ادخل كلمة المرور الجديدة',
              controller: passwordController,
              isPassword: true,
              validator: Validations.passwordValidator,
              autoValidateMode: autoValidateMode,
            ),
            16.verticalSpace,
            AppFormItem(
              title: 'تأكيد كلمة المرور',
              hint: 'ادخل كلمة المرور الجديدة',
              controller: confirmPasswordController,
              isPassword: true,
              validator: (value) {
                return Validations.passwordConfirmValidator(
                  value,
                  passwordController.text.trim(),
                );
              },
              autoValidateMode: autoValidateMode,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: CustomAppButton(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const PopScope(
                      canPop: false,
                      child: Center(
                        child: SuccessDialog(),
                      ),
                    ),
                  );
                  if (formKey.currentState!.validate()) {

                  } else if (autoValidateMode != AutovalidateMode.always) {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: 'تم',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
