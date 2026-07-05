import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';

/// The Solution section — the direct answer to each Problem point,
/// reusing the same four-card structure but reframed positively.
class SolutionSection extends StatelessWidget {
  const SolutionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'How We Help',
            title: 'Our Solution',
            subtitle:
                'A personalized, project-driven approach that closes the gap traditional education leaves behind.',
          ),
          const SizedBox(height: AppSpacing.xl),

          // Solution grid — mirrors the four Problem cards, reframed
          ResponsiveBuilder(
            mobile: (_) => const Column(
              children: [
                InfoCard(
                  icon: Icons.auto_stories_rounded,
                  title: 'Industry-Aligned Curriculum',
                  description: 'Built with hiring partners and updated every term to track real demand.',
                  iconColor: AppColors.primary,
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.build_circle_rounded,
                  title: 'Hands-On From Day One',
                  description: 'Every module pairs theory with a real project you can show employers.',
                  iconColor: AppColors.primary,
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.alt_route_rounded,
                  title: 'A Clear, Guided Path',
                  description: 'A structured journey from onboarding to offer letter — no guesswork.',
                  iconColor: AppColors.primary,
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.groups_rounded,
                  title: 'Dedicated Placement Support',
                  description: 'A placement pipeline and mentors working with you until you\'re hired.',
                  iconColor: AppColors.primary,
                ),
              ],
            ),
            desktop: (_) => const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InfoCard(
                    icon: Icons.auto_stories_rounded,
                    title: 'Industry-Aligned Curriculum',
                    description: 'Built with hiring partners and updated every term to track real demand.',
                    iconColor: AppColors.primary,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.build_circle_rounded,
                    title: 'Hands-On From Day One',
                    description: 'Every module pairs theory with a real project you can show employers.',
                    iconColor: AppColors.primary,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.alt_route_rounded,
                    title: 'A Clear, Guided Path',
                    description: 'A structured journey from onboarding to offer letter — no guesswork.',
                    iconColor: AppColors.primary,
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.groups_rounded,
                    title: 'Dedicated Placement Support',
                    description: 'A placement pipeline and mentors working with you until you\'re hired.',
                    iconColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // "How it comes together" strip
          SlideInAnimation(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.06),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.success.withOpacity(0.2)),
              ),
              child: ResponsiveBuilder(
                mobile: (_) => Column(
                  children: const [
                    _CheckLine(text: 'Learn'),
                    _CheckLine(text: 'Build'),
                    _CheckLine(text: 'Intern'),
                    _CheckLine(text: 'Get Placed'),
                  ],
                ),
                desktop: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    _CheckLine(text: 'Learn'),
                    _Arrow(),
                    _CheckLine(text: 'Build'),
                    _Arrow(),
                    _CheckLine(text: 'Intern'),
                    _Arrow(),
                    _CheckLine(text: 'Get Placed'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckLine extends StatelessWidget {
  final String text;

  const _CheckLine({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 20),
        const SizedBox(width: 6),
        Text(
          text,
          style: AppTypography.body.copyWith(
            color: AppColors.text,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Icon(Icons.arrow_forward_rounded, color: AppColors.lightText, size: 18),
    );
  }
}