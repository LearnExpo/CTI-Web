import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';

/// Our Vision section — a manifesto-style statement backed by three
/// supporting pillars that explain how we deliver on it.
class VisionSection extends StatelessWidget {
  const VisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return SectionContainer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Vision',
            title: 'Our Vision',
          ),
          const SizedBox(height: AppSpacing.lg),

          // Manifesto statement with a gradient-highlighted phrase
          SlideInAnimation(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 880),
              child: Text.rich(
                TextSpan(
                  style: AppTypography.scaledHeadingM(isMobile, isTablet)
                      .copyWith(fontWeight: FontWeight.w600, height: 1.4),
                  children: [
                    const TextSpan(text: 'We believe every learner deserves a '),
                    TextSpan(
                      text: 'direct path from classroom to career',
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = AppColors.primaryGradient.createShader(
                            const Rect.fromLTWH(0, 0, 400, 60),
                          ),
                      ),
                    ),
                    const TextSpan(
                      text:
                          ' — powered by real skills, real projects, and real outcomes.',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Three supporting pillars
          ResponsiveBuilder(
            mobile: (_) => Column(
              children: const [
                _VisionPillar(
                  icon: Icons.school_rounded,
                  title: 'Skill-First Education',
                  description:
                      'Curriculum built backwards from what employers actually need.',
                  delayMs: 0,
                ),
                SizedBox(height: AppSpacing.sm),
                _VisionPillar(
                  icon: Icons.work_rounded,
                  title: 'Real-World Experience',
                  description:
                      'Every student ships real projects before they graduate.',
                  delayMs: 100,
                ),
                SizedBox(height: AppSpacing.sm),
                _VisionPillar(
                  icon: Icons.handshake_rounded,
                  title: 'Guaranteed Pathways',
                  description:
                      'Structured placement support until you land the right role.',
                  delayMs: 200,
                ),
              ],
            ),
            desktop: (_) => const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _VisionPillar(
                    icon: Icons.school_rounded,
                    title: 'Skill-First Education',
                    description:
                        'Curriculum built backwards from what employers actually need.',
                    delayMs: 0,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _VisionPillar(
                    icon: Icons.work_rounded,
                    title: 'Real-World Experience',
                    description:
                        'Every student ships real projects before they graduate.',
                    delayMs: 100,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: _VisionPillar(
                    icon: Icons.handshake_rounded,
                    title: 'Guaranteed Pathways',
                    description:
                        'Structured placement support until you land the right role.',
                    delayMs: 200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VisionPillar extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final int delayMs;

  const _VisionPillar({
    required this.icon,
    required this.title,
    required this.description,
    required this.delayMs,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInAnimation(
      delay: Duration(milliseconds: delayMs),
      child: InfoCard(
        icon: icon,
        title: title,
        description: description,
      ),
    );
  }
}