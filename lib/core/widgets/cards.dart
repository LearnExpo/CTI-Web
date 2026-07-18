import 'dart:ui';
import 'package:career_transformation_institute/core/widgets/buttons.dart';
import 'package:career_transformation_institute/core/widgets/misc_widgets.dart';
import 'package:career_transformation_institute/widget/candidate_contact_dialog.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_typography.dart';

/// A card that lifts and adds shadow on hover — used for schools, projects,
/// and partner tiles.
class AnimatedCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const AnimatedCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.onTap,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovering ? -6 : 0, 0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(color: AppColors.border),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.12),
                      blurRadius: 30,
                      offset: const Offset(0, 16),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Frosted-glass style card — nice over gradient / dark backgrounds
/// (hero illustration backdrop, dark sections, etc.).
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double blur;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.blur = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.lg),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: AppColors.white.withOpacity(0.25),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// Simple icon + title + description card (problem points, feature bullets).
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? iconColor;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: (iconColor ?? AppColors.primary).withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Icon(icon, color: iconColor ?? AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            style: AppTypography.headingS.copyWith(fontSize: 20),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(description, style: AppTypography.body.copyWith(fontSize: 15)),
        ],
      ),
    );
  }
}

/// Big number + label — used in the Success Metrics section.
class MetricCard extends StatelessWidget {
  final String value;
  final String label;

  const MetricCard({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.headingL.copyWith(
            color: AppColors.primary,
            fontSize: 44,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppTypography.body.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}

/// Feature-style card with a leading badge — used in the Five-Layer
/// Training Architecture and Career Schools sections.
class FeatureCard extends StatelessWidget {
  final bool isRegistrationStarted;
  final String badge;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    this.isRegistrationStarted = false,
    required this.badge,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                badge,
                style: AppTypography.caption.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              if (isRegistrationStarted)
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 20,
                    ),
                    Text(
                      '  Registration Started',
                      style: AppTypography.caption.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                )
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(title, style: AppTypography.headingS.copyWith(fontSize: 22)),
          const SizedBox(height: AppSpacing.xs),
          Text(description, style: AppTypography.body.copyWith(fontSize: 15)),
          const SizedBox(height: AppSpacing.xs),
          const SizedBox(height: AppSpacing.xs),
        ],
      ),
    );
  }
}
