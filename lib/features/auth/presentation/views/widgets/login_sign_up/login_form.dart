import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/social_buttons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          24.verticalSpace,
          AppFormItem(
            title: 'البريد الالكتروني',
            hint: 'ادخل بريدك الالكتروني',
            controller: emailController,
            type: TextInputType.emailAddress,
            validator: Validations.emailValidator,
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
          6.verticalSpace,
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.forgetPasswordScreen);
            },
            child: Text(
              'نسيت كلمة المرور؟',
              style: AppTextStyle.font16Regular(
                  color: AppColors.secondaryAppColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: CustomAppButton(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (formKey.currentState!.validate()) {
                  context.pushReplacementNamed(Routes.mainNav);
                } else if (autoValidateMode != AutovalidateMode.always) {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              title: 'تسجيل الدخول',
            ),
          ),
          const SocialButtons()
        ],
      ),
    );
  }
}
