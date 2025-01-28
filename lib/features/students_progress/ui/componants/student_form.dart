import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';
import 'package:oly_elazm/core/widgets/app_gradient_button.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController commentController;
  late final TextEditingController newLessonController;
  late final TextEditingController linkController;

  @override
  void initState() {
    commentController = TextEditingController();
    newLessonController = TextEditingController();
    linkController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    newLessonController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            AppFormItem(
              title: 'اضافة تعليق',
              hint: 'اكتب تعليقك هنا',
              borderRadius: 20.r,
              controller: commentController,
              textStyle: AppTextStyle.font16Bold(),
            ),
            16.verticalSpace,
            AppFormItem(
              title: 'اضافة حفظ جديد',
              hint: 'اكتب الحفظ  هنا',
              borderRadius: 20.r,
              controller: newLessonController,
              textStyle: AppTextStyle.font16Bold(),
            ),
            16.verticalSpace,
            AppFormItem(
              title: 'اضافة رابط تسميع',
              hint: 'اضف الرابط هنا',
              borderRadius: 20.r,
              controller: linkController,
              textStyle: AppTextStyle.font16Bold(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: CustomAppButton(
                onTap: () {},
                title: 'ارسال',
              ),
            )
          ],
        ),
      ),
    );
  }
}
