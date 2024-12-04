import 'package:flutter/material.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;
  final Function onSubmit;
  final Function(AutovalidateMode) onAutoValidateChange;

  const SubmitButton({
    super.key,
    required this.formKey,
    required this.autoValidateMode,
    required this.onSubmit,
    required this.onAutoValidateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: CustomAppButton(
        title: 'تم',
        width: AppSize.w358,
        height: AppSize.h48,
        isRadial: true,
        gradientColors: AppColors.radialOverlay,
        gradientStops: [0.0, 1.0],
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          if (formKey.currentState!.validate()) {
            onSubmit();
          } else if (autoValidateMode != AutovalidateMode.always) {
            onAutoValidateChange(AutovalidateMode.always);
            onSubmit();
          }
        },
      ),
    );
  }
}
