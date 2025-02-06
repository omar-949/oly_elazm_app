import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/helpers/extentions.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final bool?hasBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = const Color(0xffFFD08A),
    this.hasBackButton=true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: AppTextStyle.font20Medium(),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: hasBackButton!?const BackButton(color: Colors.black):SizedBox(),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
