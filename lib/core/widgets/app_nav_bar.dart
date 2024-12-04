import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oly_elazm/core/theme/app_colors.dart';

class AppNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const AppNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: const <Widget>[
        NavIcon('assets/svgs/home.svg'),
        NavIcon('assets/svgs/mosque.svg'),
        NavIcon('assets/svgs/book.svg'),
        NavIcon('assets/svgs/pray.svg'),
        NavIcon('assets/svgs/settings.svg'),
      ],
      index: selectedIndex,
      color: AppColors.mainAppColor,
      buttonBackgroundColor: AppColors.mainAppColor,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: onTap,
      height: 55.h,
    );
  }
}

class NavIcon extends StatelessWidget {
  final String assetPath;

  const NavIcon(this.assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.h,
      child: SvgPicture.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
