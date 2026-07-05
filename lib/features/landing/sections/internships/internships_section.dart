import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';

/// Internship Ecosystem — how structured internships work, plus the
/// scale of the partner network behind them.
class InternshipsSection extends StatelessWidget {
  const InternshipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Real Experience',
            title: 'Internship Ecosystem',
            subtitle:
                'Structured placements with partner companies that turn learning into experience.',
          ),
          const SizedBox(height: AppSpacing.xl),

          // How it works
          ResponsiveBuilder(
            mobile: (_) => const Column(
              children: [
                InfoCard(
                  icon: Icons.fact_check_rounded,
                  title: 'Matched, Not Random',
                  description: 'Placed with a partner company based on your school, skills, and goals.',
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.supervisor_account_rounded,
                  title: 'Mentored Throughout',
                  description: 'A dedicated mentor checks in weekly and reviews your work.',
                ),
                SizedBox(height: AppSpacing.sm),
                InfoCard(
                  icon: Icons.verified_rounded,
                  title: 'Evaluated for Conversion',
                  description: 'Strong performance is the fast track to a full-time offer.',
                ),
              ],
            ),
            desktop: (_) => const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InfoCard(
                    icon: Icons.fact_check_rounded,
                    title: 'Matched, Not Random',
                    description: 'Placed with a partner company based on your school, skills, and goals.',
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.supervisor_account_rounded,
                    title: 'Mentored Throughout',
                    description: 'A dedicated mentor checks in weekly and reviews your work.',
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InfoCard(
                    icon: Icons.verified_rounded,
                    title: 'Evaluated for Conversion',
                    description: 'Strong performance is the fast track to a full-time offer.',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Stats strip
          SlideInAnimation(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.border),
              ),
              child: ResponsiveBuilder(
                mobile: (_) => const Column(
                  children: [
                    _StatItem(value: 120, suffix: '+', label: 'Partner companies'),
                    SizedBox(height: AppSpacing.lg),
                    _StatItem(value: 8, suffix: ' wks', label: 'Average internship length'),
                    SizedBox(height: AppSpacing.lg),
                    _StatItem(value: 68, suffix: '%', label: 'Convert to full-time offers'),
                  ],
                ),
                desktop: (_) => const Row(
                  children: [
                    Expanded(child: _StatItem(value: 120, suffix: '+', label: 'Partner companies')),
                    Expanded(child: _StatItem(value: 8, suffix: ' wks', label: 'Average internship length')),
                    Expanded(child: _StatItem(value: 68, suffix: '%', label: 'Convert to full-time offers')),
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

class _StatItem extends StatelessWidget {
  final int value;
  final String suffix;
  final String label;

  const _StatItem({
    required this.value,
    required this.suffix,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MetricCard(
      value: '$value$suffix',
      label: label,
    );
  }
}