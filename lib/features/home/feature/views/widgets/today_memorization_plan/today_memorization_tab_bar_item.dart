import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oly_elazm/core/helpers/app_size.dart';

class TabItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color? color;

  const TabItem({
    super.key,
    required this.iconPath,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconPath,
          width: AppSize.w24,
          height: AppSize.h24,
        ),
        SizedBox(width: AppSize.w5),
        Text(label),
      ],
    );
  }
}
