import 'package:flutter/material.dart';
import 'package:oly_elazm/core/widgets/app_bar.dart';

import 'componants/student_progress_body.dart';

class StudentProgress extends StatelessWidget {
  const StudentProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'المُحفظ',
      ),
      body: StudentProgressBody(),
    );
  }
}
