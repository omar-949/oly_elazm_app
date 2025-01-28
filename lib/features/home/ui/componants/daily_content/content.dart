import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class Content extends StatelessWidget {
  const Content({
    super.key, required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 20.h,
      ),
      child: Text(
        content,
        style: AppTextStyle.font20Regular().copyWith(fontFamily:GoogleFonts.amiriQuran().fontFamily),
        textAlign: TextAlign.center,
      ),
    );
  }
}
