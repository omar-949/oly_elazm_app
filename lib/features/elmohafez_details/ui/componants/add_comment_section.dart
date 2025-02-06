import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';
import 'package:oly_elazm/core/widgets/app_form_item.dart';

class AddCommentSection extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController commentController;

  const AddCommentSection({
    super.key,
    required this.formKey,
    required this.commentController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: AppFormItem(
        title: 'اضافة تعليق',
        hint: 'اكتب تعليقك هنا',
        borderRadius: 20.r,
        controller: commentController,
        textStyle: AppTextStyle.font16Bold(),
      ),
    );
  }
}
