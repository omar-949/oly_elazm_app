import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/stepper/stepper_icons.dart';
import 'package:oly_elazm/features/home/feature/views/widgets/stepper/stepper_row.dart';

class HomeStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const HomeStepper({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalSteps,
            (index) {
              bool isCompleted = index < currentStep;
              return Column(
                children: [
                  StepperRow(
                    isCompleted: isCompleted,
                    totalSteps: totalSteps,
                    index: index,
                  ),
                  5.verticalSpace,
                  StepperIcons(
                    index: index,
                    totalSteps: totalSteps,
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
