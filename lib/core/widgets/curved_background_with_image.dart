import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/widgets/background_curved_container.dart';
import 'package:oly_elazm/core/widgets/circle_image.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_cubit.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CurvedBackgroundWithImage extends StatelessWidget {
  final String? imagePath;

  const CurvedBackgroundWithImage({
    super.key,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        const BackgroundCurvedContainer(),
        CircleImage(imagePath: imagePath,),

      ],
    );
  }
}
