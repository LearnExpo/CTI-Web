import 'package:flutter/material.dart';

/// Breakpoints used across the whole site.
class AppBreakpoints {
  AppBreakpoints._();

  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

enum DeviceType { mobile, tablet, desktop }

class Responsive {
  Responsive._();

  static DeviceType deviceTypeOf(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < AppBreakpoints.mobile) return DeviceType.mobile;
    if (width < AppBreakpoints.tablet) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < AppBreakpoints.mobile;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= AppBreakpoints.mobile && width < AppBreakpoints.tablet;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppBreakpoints.tablet;

  /// Horizontal page padding that grows with screen size.
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < AppBreakpoints.mobile) return 20;
    if (width < AppBreakpoints.tablet) return 40;
    if (width < AppBreakpoints.desktop) return 80;
    return 120;
  }

  /// Clamps content to a max width and centers it — useful for very
  /// wide desktop / ultra-wide monitors.
  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width > AppBreakpoints.desktop ? AppBreakpoints.desktop : width;
  }
}

/// Chooses a value based on the current device type. Mirrors the
/// `ResponsiveBuilder` widget below but usable without a widget wrapper.
T responsiveValue<T>(
  BuildContext context, {
  required T mobile,
  T? tablet,
  required T desktop,
}) {
  final type = Responsive.deviceTypeOf(context);
  switch (type) {
    case DeviceType.mobile:
      return mobile;
    case DeviceType.tablet:
      return tablet ?? desktop;
    case DeviceType.desktop:
      return desktop;
  }
}
