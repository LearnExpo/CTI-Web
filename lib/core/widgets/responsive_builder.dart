import 'package:flutter/material.dart';
import '../responsive/responsive.dart';

/// Builds a different widget tree per device type. Any of [tablet] may be
/// omitted — it falls back to [desktop].
class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final type = Responsive.deviceTypeOf(context);
    switch (type) {
      case DeviceType.mobile:
        return mobile(context);
      case DeviceType.tablet:
        return (tablet ?? desktop)(context);
      case DeviceType.desktop:
        return desktop(context);
    }
  }
}

/// Wraps a section's content, centering it and clamping to a max width
/// with consistent horizontal padding and vertical rhythm.
class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? verticalPadding;
  final Key? sectionKey;

  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.verticalPadding,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.horizontalPadding(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor,
      padding: (verticalPadding ?? const EdgeInsets.symmetric(vertical: 80))
          .add(EdgeInsets.symmetric(horizontal: hPad)),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Responsive.maxContentWidth(context),
          ),
          child: child,
        ),
      ),
    );
  }
}
