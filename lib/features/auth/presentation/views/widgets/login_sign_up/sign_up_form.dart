import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/license_check_box.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/social_buttons.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.verticalSpace,
          AppFormItem(
            title: 'البريد الالكتروني',
            hint: 'ادخل بريدك الالكتروني',
            controller: emailController,
            type: TextInputType.emailAddress,
            validator: Validations.emailValidator,
          ),
          16.verticalSpace,
          AppFormItem(
            title: 'رقم الهاتف',
            hint: 'ادخل رقم الهاتف',
            controller: phoneNumberController,
            type: TextInputType.number,
            validator: Validations.phoneNumberValidator,
            autoValidateMode: autoValidateMode,
          ),
          16.verticalSpace,
          AppFormItem(
            title: 'كلمة المرور',
            hint: 'ادخل كلمة المرور',
            controller: passwordController,
            isPassword: true,
            validator: Validations.passwordValidator,
            autoValidateMode: autoValidateMode,
          ),
          8.verticalSpace,
          const LicenseCheckBox(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: CustomAppButton(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (formKey.currentState!.validate()) {
                } else if (autoValidateMode != AutovalidateMode.always) {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              title: 'تسجيل الدخول',
            ),
          ),
          const SocialButtons(),
        ],
      ),
    );
  }
}
