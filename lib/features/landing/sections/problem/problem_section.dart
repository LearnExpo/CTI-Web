import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/misc_widgets.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';

/// The Problem section — a stat callout followed by a grid of the
/// specific gaps traditional education leaves for students and employers.
class ProblemSection extends StatelessWidget {
  const ProblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'The Challenge',
            title: 'The Problem',
            subtitle:
                'Traditional education wasn\'t built for how fast the job market moves.',
          ),
          const SizedBox(height: AppSpacing.xl),

          // Stat callout banner
          SlideInAnimation(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.lg,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.darkGradient,
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
              child: ResponsiveBuilder(
                mobile: (_) => const Column(
                  children: [
                    _StatBlock(value: 76, suffix: '%', label: 'of graduates feel unprepared for real work'),
                    SizedBox(height: AppSpacing.lg),
                    _StatBlock(value: 6, suffix: ' mo', label: 'average time-to-hire after graduation'),
                    SizedBox(height: AppSpacing.lg),
                    _StatBlock(value: 42, suffix: '%', label: 'of employers cite a skills mismatch'),
                  ],
                ),
                desktop: (_) => const Row(
                  children: [
                    Expanded(child: _StatBlock(value: 76, suffix: '%', label: 'of graduates feel unprepared for real work')),
                    Expanded(child: _StatBlock(value: 6, suffix: ' mo', label: 'average time-to-hire after graduation')),
                    Expanded(child: _StatBlock(value: 42, suffix: '%', label: 'of employers cite a skills mismatch')),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Problem grid
          ResponsiveBuilder(
            mobile: (_) => Column(
              children: const [
                InfoCard(
                  icon: Icons.menu_book_rounded,
                  title: 'Outdated Curriculum',
                  description: 'Courses lag years behind what the industry actually uses.',
                  iconColor: AppColors.secondary,
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.psychology_alt_rounded,
                  title: 'No Practical Exposure',
                  description: 'Theory-heavy programs leave little room for hands-on projects.',
                  iconColor: AppColors.secondary,
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.route_rounded,
                  title: 'Unclear Career Path',
                  description: 'Students graduate without a clear route into their target role.',
                  iconColor: AppColors.secondary,
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.support_agent_rounded,
                  title: 'No Placement Support',
                  description: 'Job hunting is left entirely up to the student, with no guidance.',
                  iconColor: AppColors.secondary,
                ),
              ],
            ),
            desktop: (_) => const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InfoCard(
                    icon: Icons.menu_book_rounded,
                    title: 'Outdated Curriculum',
                    description: 'Courses lag years behind what the industry actually uses.',
                    iconColor: AppColors.secondary,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.psychology_alt_rounded,
                    title: 'No Practical Exposure',
                    description: 'Theory-heavy programs leave little room for hands-on projects.',
                    iconColor: AppColors.secondary,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.route_rounded,
                    title: 'Unclear Career Path',
                    description: 'Students graduate without a clear route into their target role.',
                    iconColor: AppColors.secondary,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.support_agent_rounded,
                    title: 'No Placement Support',
                    description: 'Job hunting is left entirely up to the student, with no guidance.',
                    iconColor: AppColors.secondary,
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

class _StatBlock extends StatelessWidget {
  final int value;
  final String suffix;
  final String label;

  const _StatBlock({
    required this.value,
    required this.suffix,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedCounter(
          end: value,
          suffix: suffix,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 44,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.lightText, fontSize: 14),
        ),
      ],
    );
  }
}