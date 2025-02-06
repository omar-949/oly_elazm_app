import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';
import 'package:oly_elazm/core/theme/app_text_style.dart';

class CustomListItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const CustomListItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: AppSize.w24,
        height: AppSize.h24,
      ),
      title: Text(
        label,
        style: AppTextStyle.font20Regular().copyWith(fontFamily: 'Roboto'),
      ),
      trailing:
        SvgPicture.asset('assets/svgs/arrow-back.svg', width: AppSize.w24,),
      onTap: onTap,
    );
  }
}
