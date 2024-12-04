import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/helpers/app_size.dart';

class BackgroundSvg extends StatelessWidget {
  final String assetPath;
  const BackgroundSvg({
    super.key,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: SvgPicture.asset(
        assetPath,
        width: AppSize.w445,
        height: AppSize.h185,
        fit: BoxFit.cover,
        placeholderBuilder: (context) => Center(
          child: CircularProgressIndicator(
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
