import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Fish thumbnail / hero image matching Figma card and detail layouts.
class FishSpeciesImage extends StatelessWidget {
  const FishSpeciesImage({
    super.key,
    required this.imageAsset,
    this.width = 44,
    this.height = 44,
    this.borderRadius = 4,
    this.detail = false,
  });

  final String imageAsset;
  final double width;
  final double height;
  final double borderRadius;
  final bool detail;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      gradient: detail
          ? const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFD1EBFF)],
            )
          : null,
      color: detail ? null : const Color(0xFFF5F8FD),
      borderRadius: BorderRadius.circular(borderRadius),
    );

    return Container(
      width: width,
      height: height,
      decoration: decoration,
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        imageAsset,
        fit: detail ? BoxFit.contain : BoxFit.cover,
        errorBuilder: (_, __, ___) => Icon(
          Icons.set_meal,
          size: height * 0.65,
          color: AppColors.primary.withValues(alpha: 0.85),
        ),
      ),
    );
  }
}
