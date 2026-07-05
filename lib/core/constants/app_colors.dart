import 'package:flutter/material.dart';

/// Central color palette for the Career Transformation Institute app.
/// Pulled directly from the Phase 3 design system.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF0057FF);
  static const Color secondary = Color(0xFF6C63FF);
  static const Color accent = Color(0xFF00C2FF);
  static const Color success = Color(0xFF00C853);

  static const Color background = Color(0xFFF8FAFC);
  static const Color dark = Color(0xFF0F172A);

  static const Color text = Color(0xFF1E293B);
  static const Color lightText = Color(0xFF64748B);

  static const Color white = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE2E8F0);

  /// Handy gradients built from the palette above, used for hero
  /// backgrounds, buttons, and accent shapes throughout the site.
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, accent],
  );

  static const LinearGradient heroBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [background, white],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [dark, Color(0xFF1E293B)],
  );
}
