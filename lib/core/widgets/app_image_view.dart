import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';
import 'app_shimmer.dart';
import 'app_text.dart';

class AppImageView extends StatelessWidget {
  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color; // New property
  final BoxFit? fit;
  final Alignment? alignment;
  final bool isCircular;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final BoxBorder? border;

  /// A flexible image widget supporting circular and rectangular shapes,
  /// with border and border radius options.
  const AppImageView({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.isCircular = false,
    this.onTap,
    this.margin,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      decoration: _buildDecoration(),
      clipBehavior: isCircular ? Clip.antiAlias : Clip.none,
      child: GestureDetector(
        // onTap: onTap ?? () => _showImageDialog(context),
        child: _buildImageWithBorder(),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
      border: isCircular ? border : null,
      borderRadius: isCircular ? null : borderRadius,
    );
  }

  Widget _buildImageWithBorder() {
    return isCircular
        ? _CircularImage(
            imagePath: imagePath,
            height: height,
            width: width,
            fit: fit,
            color: color,
            // Pass color
            border: border,
            errorPlaceholder: _errorPlaceholder(),
          )
        : _RectangularImage(
            imagePath: imagePath,
            height: height,
            width: width,
            fit: fit,
            color: color,
            // Pass color
            borderRadius: borderRadius,
            border: border,
            errorPlaceholder: _errorPlaceholder(),
          );
  }

  Widget _errorPlaceholder() {
    return Image.network(
      "https://i.pinimg.com/736x/2c/f5/58/2cf558ab8c1f12b43f7326945672805e.jpg",
      fit: BoxFit.cover,
    );
  }
}

class _CircularImage extends StatelessWidget {
  final String? imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BoxBorder? border;
  final Color? color; // New property
  final Widget errorPlaceholder;

  const _CircularImage({
    this.imagePath,
    this.height,
    this.width,
    this.fit,
    this.border,
    this.color, // New property
    required this.errorPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
        image: imagePath != null && imagePath!.isNotEmpty && color == null
            ? DecorationImage(
                image: ImageFactory.getImageProvider(imagePath!),
                fit: fit ?? BoxFit.cover,
              )
            : null,
      ),
      child: imagePath == null || imagePath!.isEmpty
          ? errorPlaceholder
          : color != null
              ? ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    color!,
                    BlendMode.srcIn,
                  ),
                  child: ImageFactory.buildImage(imagePath),
                )
              : null,
    );
  }
}

class _RectangularImage extends StatelessWidget {
  final String? imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Color? color; // New property
  final Widget errorPlaceholder;

  const _RectangularImage({
    this.imagePath,
    this.height,
    this.width,
    this.fit,
    this.borderRadius,
    this.border,
    this.color, // New property
    required this.errorPlaceholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: border,
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: imagePath != null && imagePath!.isNotEmpty
            ? color != null
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      color!,
                      BlendMode.srcIn,
                    ),
                    child: ImageFactory.buildImage(imagePath),
                  )
                : ImageFactory.buildImage(imagePath)
            : errorPlaceholder,
      ),
    );
  }
}

class ImageFactory {
  static ImageProvider getImageProvider(String imagePath) {
    switch (imagePath.imageType) {
      case ImageType.network:
        return NetworkImage(imagePath);
      case ImageType.file:
        return FileImage(File(imagePath));
      case ImageType.svg:
      case ImageType.svgNetwork:
        throw Exception("SVG images not supported here.");
      case ImageType.png:
      default:
        return AssetImage(imagePath);
    }
  }

  static Widget buildImage(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const SizedBox();
    }

    switch (imagePath.imageType) {
      case ImageType.svgNetwork:
        return SvgPicture.network(imagePath);
      case ImageType.svg:
        return SvgPicture.asset(
          imagePath,
        );
      case ImageType.file:
        return Image.file(File(imagePath));
      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: imagePath,
          placeholder: (context, url) => const AppShimmer(avatar: false),
          errorWidget: (context, url, error) => Image.network(
            "https://i.pinimg.com/736x/2c/f5/58/2cf558ab8c1f12b43f7326945672805e.jpg",
            fit: BoxFit.contain,
          ),
        );
      case ImageType.png:
      default:
        return Image.asset(imagePath);
    }
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if ((startsWith('http') || startsWith('https')) && endsWith('.svg')) {
      return ImageType.svgNetwork;
    } else if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://') || startsWith('/data/user')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, unknown, svgNetwork }
