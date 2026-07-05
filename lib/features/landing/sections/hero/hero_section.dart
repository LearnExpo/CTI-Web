import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/responsive_builder.dart';
import 'widgets/hero_background.dart';
import 'widgets/hero_illustration.dart';

/// The most critical section on the page — first impression for both
/// investors and prospective students.
class HeroSection extends StatelessWidget {
  final VoidCallback? onPrimaryCta;
  final VoidCallback? onSecondaryCta;

  const HeroSection({super.key, this.onPrimaryCta, this.onSecondaryCta});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final hPad = Responsive.horizontalPadding(context);

    return Stack(
      children: [
        const Positioned.fill(child: HeroBackground()),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: hPad,
            vertical: isMobile ? 56 : 100,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.maxContentWidth(context),
              ),
              child: ResponsiveBuilder(
                mobile: (_) => _StackedLayout(
                  isMobile: isMobile,
                  isTablet: isTablet,
                  onPrimaryCta: onPrimaryCta,
                  onSecondaryCta: onSecondaryCta,
                ),
                desktop: (_) => _SideBySideLayout(
                  isMobile: isMobile,
                  isTablet: isTablet,
                  onPrimaryCta: onPrimaryCta,
                  onSecondaryCta: onSecondaryCta,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SideBySideLayout extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final VoidCallback? onPrimaryCta;
  final VoidCallback? onSecondaryCta;

  const _SideBySideLayout({
    required this.isMobile,
    required this.isTablet,
    this.onPrimaryCta,
    this.onSecondaryCta,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: _HeroCopy(
            isMobile: isMobile,
            isTablet: isTablet,
            align: CrossAxisAlignment.start,
            textAlign: TextAlign.left,
            onPrimaryCta: onPrimaryCta,
            onSecondaryCta: onSecondaryCta,
          ),
        ),
        const SizedBox(width: AppSpacing.xl),
        Expanded(
          flex: 5,
          child: SlideInAnimation(
            delay: const Duration(milliseconds: 200),
            beginOffset: const Offset(0.1, 0),
            child: const HeroIllustration(),
          ),
        ),
      ],
    );
  }
}

class _StackedLayout extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final VoidCallback? onPrimaryCta;
  final VoidCallback? onSecondaryCta;

  const _StackedLayout({
    required this.isMobile,
    required this.isTablet,
    this.onPrimaryCta,
    this.onSecondaryCta,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HeroCopy(
          isMobile: isMobile,
          isTablet: isTablet,
          align: CrossAxisAlignment.center,
          textAlign: TextAlign.center,
          onPrimaryCta: onPrimaryCta,
          onSecondaryCta: onSecondaryCta,
        ),
        const SizedBox(height: AppSpacing.xl),
        const SlideInAnimation(
          delay: Duration(milliseconds: 200),
          child: HeroIllustration(),
        ),
      ],
    );
  }
}

class _HeroCopy extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final CrossAxisAlignment align;
  final TextAlign textAlign;
  final VoidCallback? onPrimaryCta;
  final VoidCallback? onSecondaryCta;

  const _HeroCopy({
    required this.isMobile,
    required this.isTablet,
    required this.align,
    required this.textAlign,
    this.onPrimaryCta,
    this.onSecondaryCta,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        SlideInAnimation(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${AppStrings.heroHeadlineLine1}\n',
                  style: AppTypography.scaledHeadingXL(isMobile, isTablet),
                ),
                TextSpan(
                  text: AppStrings.heroHeadlineLine2,
                  style: AppTypography.scaledHeadingXL(isMobile, isTablet)
                      .copyWith(
                    foreground: Paint()
                      ..shader = AppColors.primaryGradient.createShader(
                        const Rect.fromLTWH(0, 0, 400, 80),
                      ),
                  ),
                ),
              ],
            ),
            textAlign: textAlign,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        SlideInAnimation(
          delay: const Duration(milliseconds: 100),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(
              AppStrings.heroSubtitle,
              textAlign: textAlign,
              style: AppTypography.body,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        SlideInAnimation(
          delay: const Duration(milliseconds: 200),
          child: Wrap(
            alignment:
                align == CrossAxisAlignment.center ? WrapAlignment.center : WrapAlignment.start,
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              GradientButton(
                label: AppStrings.heroPrimaryCta,
                icon: Icons.arrow_forward_rounded,
                onPressed: onPrimaryCta,
              ),
              SecondaryButton(
                label: AppStrings.heroSecondaryCta,
                onPressed: onSecondaryCta,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
