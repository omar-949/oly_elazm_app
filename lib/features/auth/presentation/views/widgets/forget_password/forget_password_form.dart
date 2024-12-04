import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  late final TextEditingController emailController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
              title: 'البريد الالكتروني',
              hint: 'ادخل بريدك الالكتروني',
              controller: emailController,
              type: TextInputType.emailAddress,
              validator: Validations.emailValidator,
              autoValidateMode: autoValidateMode,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: CustomAppButton(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (formKey.currentState!.validate()) {
                    context.pushNamed(Routes.verificationCodeScreen);
                  } else if (autoValidateMode != AutovalidateMode.always) {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                title: 'ارسال',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
