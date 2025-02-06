import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/core/helpers/validations.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/routing/routing_arguments.dart';
import 'package:oly_elazm/core/widgets/app_button_loading.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_state.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/login_sign_up/license_check_box.dart';
import 'package:oly_elazm/features/user_info/presentation/manager/user_info_cubit.dart';

import '../../../../../notification/helper/local_notification_service.dart';
import '../../../data/models/send_models/register_send_model.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController passwordController;
  late final TextEditingController ageController;
  late final TextEditingController nameController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    ageController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    ageController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.registerState.isSuccess) {
            context.pushNamed(Routes.verificationCodeScreen,
                arguments: VerifyCodeArguments(
                    email: emailController.text,
                    code: state.verifyCode.toString()));

            LocalNotificationService.showNotification(
                title: 'رمز التحقق', body: state.verifyCode.toString());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                AppFormItem(
                  title: "اسم المستخدم",
                  hint: 'ادخل اسمك',
                  controller: nameController,
                  type: TextInputType.name,
                  validator: Validations.userNameValidator,
                ),
                16.verticalSpace,
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
                  title: 'العمر',
                  hint: 'ادخل عمرك',
                  controller: ageController,
                  type: TextInputType.number,
                  validator: Validations.ageValidator,
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
                Center(
                  child: BlocBuilder<UserInfoCubit, UserInfoState>(
                    buildWhen: (previous, current) =>
                        current is UserInfoUpdated,
                    builder: (context, stateUser) {
                      return state.registerState.isLoading
                          ? AppButtonLoading(
                              title: "تسجيل الدخول",
                            )
                          : CustomAppButton(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                if (formKey.currentState!.validate()) {
                                  if (stateUser is UserInfoUpdated) {
                                    context.read<AuthCubit>().register(
                                            registerSendModel:
                                                RegisterSendModel(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phoneNumber:
                                              phoneNumberController.text,
                                          name: nameController.text,
                                          age: int.parse(ageController.text),
                                          language: SharedPrefHelper.getString(
                                              AppStrings.langKey),
                                          quranPartsMemorized: stateUser
                                              .userInfoModel!.partNumber,
                                          job: stateUser.userInfoModel!.job!,
                                          country:
                                              stateUser.userInfoModel!.country!,
                                          gender:
                                              stateUser.userInfoModel!.gender!,
                                          role: stateUser
                                              .userInfoModel!.userType!,
                                                  yearsOfExperience: stateUser.userInfoModel!.yearsOfExperience!,
                                        ));
                                  }
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
        },
      ),
    );
  }
}
