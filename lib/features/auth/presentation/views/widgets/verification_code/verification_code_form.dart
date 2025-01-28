import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/helpers/main_functions.dart';
import 'package:oly_elazm/core/routing/named_router.dart';
import 'package:oly_elazm/core/widgets/app_button_loading.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_state.dart';
import 'package:oly_elazm/features/auth/presentation/views/widgets/verification_code/code_pinput.dart';

import '../../../../../../core/routing/routing_arguments.dart';
import '../../../../../../core/theme/app_colors.dart';

class VerificationCodeForm extends StatefulWidget {
  const VerificationCodeForm({super.key, required this.verifyCode});

  final VerifyCodeArguments verifyCode;

  @override
  State<VerificationCodeForm> createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
  late final TextEditingController otpController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    otpController = TextEditingController();
    otpController.text = widget.verifyCode.code.toString();
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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if(state.verifyCodeState.isSuccess){
                  showToast(text: 'تم التحقق بنجاح', color: AppColors.successColor);
                  context.pushNamedAndRemoveUntil(Routes.loginSignUpScreen,predicate: (route) => false,);

                }
              },
              builder: (context, state) {
                return state.verifyCodeState.isLoading
                    ? AppButtonLoading(title: 'تحقق')
                    : CustomAppButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().verify(verifyCodeArguments: widget.verifyCode);
                          }
                        },
                        title: 'تحقق',
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
