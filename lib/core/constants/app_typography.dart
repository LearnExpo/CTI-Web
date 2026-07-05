import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Type scale from the Phase 3 design system.
/// Swap [fontFamily] for 'Poppins' (or your brand font) once you add the
/// font files under assets/fonts and register them in pubspec.yaml.
class AppTypography {
  AppTypography._();

  static const String? fontFamily = null; // e.g. 'Poppins'

  static const TextStyle headingXL = TextStyle(
    fontFamily: fontFamily,
    fontSize: 72,
    fontWeight: FontWeight.w700,
    height: 1.1,
    color: AppColors.text,
  );

  static const TextStyle headingL = TextStyle(
    fontFamily: fontFamily,
    fontSize: 56,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColors.text,
  );

  static const TextStyle headingM = TextStyle(
    fontFamily: fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: AppColors.text,
  );

  static const TextStyle headingS = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.lightText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.lightText,
  );

  /// Responsive helpers: scale down large headings gracefully on mobile.
  static TextStyle scaledHeadingXL(bool isMobile, bool isTablet) {
    if (isMobile) return headingXL.copyWith(fontSize: 40);
    if (isTablet) return headingXL.copyWith(fontSize: 56);
    return headingXL;
  }

  static TextStyle scaledHeadingL(bool isMobile, bool isTablet) {
    if (isMobile) return headingL.copyWith(fontSize: 32);
    if (isTablet) return headingL.copyWith(fontSize: 44);
    return headingL;
  }

  static TextStyle scaledHeadingM(bool isMobile, bool isTablet) {
    if (isMobile) return headingM.copyWith(fontSize: 28);
    if (isTablet) return headingM.copyWith(fontSize: 34);
    return headingM;
  }
}
