import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_imgs.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/main_functions.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_button_loading.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/core/widgets/app_image_view.dart';
import 'package:oly_elazm/core/widgets/app_text.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_state.dart';

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
          60.verticalSpace,
          // GestureDetector(
          //   onTap: () {
          //     context.pushNamed(Routes.forgetPasswordScreen);
          //   },
          //   child: Text(
          //     'نسيت كلمة المرور؟',
          //     style: AppTextStyle.font16Regular(
          //         color: AppColors.secondaryAppColor),
          //   ),
          // ),
          Center(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.loginState.isSuccess) {
                  context.pushReplacementNamed(Routes.mainNav);
                  showToast(
                      text: 'تم تسجيل الدخول بنجاح',
                      color: AppColors.successColor);
                }
                if (state.loginState.isForbidden) {
                  customAlertDialog(
                      context: context,
                      marginHPadding:20.w,
                      vPadding: 20.h,
                      hPadding: 16.w,
                      content: Column(
                        children: [
                          AppImageView(
                              imagePath: AppImages.waitingImage),
                          16.verticalSpace,
                          AppText(
                            text: 'تم ارسال طلبك',
                            textColor: AppColors.mainAppColor,
                            textSize: 24.sp,
                            textWeight: FontWeight.w600,
                            textAlign:TextAlign.center,
                          ),
                          16.verticalSpace,
                          AppText(
                            text:
                                "يرجى الانتظار.. سيقوم المسؤولون بتسكينك مع أحد المحفظين",
                            textSize: 16.sp,
                            textWeight: FontWeight.w500,
                          ),
                        ],
                      ));
                }
              },
              builder: (context, state) {
                return state.loginState.isLoading
                    ? const AppButtonLoading(title: 'تسجيل الدخول')
                    : CustomAppButton(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                          } else if (autoValidateMode !=
                              AutovalidateMode.always) {
                            autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        title: 'تسجيل الدخول',
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
