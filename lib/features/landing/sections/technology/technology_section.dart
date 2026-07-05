import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';
import 'widgets/platform_mockup.dart';

/// Technology Platform — the software powering personalized learning
/// paths, mentorship, and progress tracking. Paired copy + mockup layout,
/// mirroring the Hero section's structure but flipped and platform-focused.
class TechnologySection extends StatelessWidget {
  const TechnologySection({super.key});

  static const _features = [
    (icon: Icons.route_rounded, text: 'Personalized learning paths that adapt to your pace'),
    (icon: Icons.forum_rounded, text: 'Built-in mentorship chat and weekly check-ins'),
    (icon: Icons.insights_rounded, text: 'Real-time progress tracking across every module'),
    (icon: Icons.badge_rounded, text: 'A portfolio builder that doubles as your resume'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.background,
      child: ResponsiveBuilder(
        mobile: (_) => Column(
          children: [
            const SectionTitle(
              eyebrow: 'Platform',
              title: 'Technology Platform',
              subtitle:
                  'The platform powering personalized learning paths, mentorship, and progress tracking.',
            ),
            const SizedBox(height: AppSpacing.xl),
            const SlideInAnimation(child: PlatformMockup()),
            const SizedBox(height: AppSpacing.xl),
            _FeatureList(align: CrossAxisAlignment.start),
          ],
        ),
        desktop: (_) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(
                    eyebrow: 'Platform',
                    title: 'Technology Platform',
                    subtitle:
                        'The platform powering personalized learning paths, mentorship, and progress tracking.',
                    align: TextAlign.left,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const _FeatureList(align: CrossAxisAlignment.start),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.xl),
            const Expanded(
              flex: 6,
              child: SlideInAnimation(
                beginOffset: Offset(0.1, 0),
                child: PlatformMockup(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureList extends StatelessWidget {
  final CrossAxisAlignment align;

  const _FeatureList({required this.align});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        for (int i = 0; i < TechnologySection._features.length; i++)
          SlideInAnimation(
            delay: Duration(milliseconds: i * 100),
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      TechnologySection._features[i].icon,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        TechnologySection._features[i].text,
                        style: AppTypography.body.copyWith(fontSize: 15, color: AppColors.text),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}