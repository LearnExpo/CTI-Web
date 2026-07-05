import 'package:career_transformation_institute/core/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/misc_widgets.dart';
import '../../../../core/widgets/section_title.dart';

enum _PhaseStatus { live, inProgress, planned }

/// Expansion Roadmap — company milestones as a sequence of phase cards,
/// each tagged with a status. Distinct from Journey's connected-dot
/// timeline since this tracks the business, not an individual student.
class RoadmapSection extends StatelessWidget {
  const RoadmapSection({super.key});

  static const _phases = [
    (
      year: '2024',
      title: 'Launch: 3 Career Schools',
      description:
          'Founded with Software Engineering, Design, and Data Science tracks.',
      status: _PhaseStatus.live,
    ),
    (
      year: '2025',
      title: 'National Expansion',
      description:
          'Scaled to 5 cities and grew the partner network past 100 companies.',
      status: _PhaseStatus.live,
    ),
    (
      year: '2026',
      title: 'Applied AI School + Corporate Upskilling',
      description:
          'Launching a dedicated AI track and B2B upskilling programs for partners.',
      status: _PhaseStatus.inProgress,
    ),
    (
      year: '2027',
      title: 'International Expansion',
      description:
          'Bringing the model to 3 new countries, starting with partner-led pilots.',
      status: _PhaseStatus.planned,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final columns = isMobile ? 1 : (isTablet ? 2 : 4);

    return SectionContainer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: "What's Next",
            title: 'Expansion Roadmap',
            subtitle:
                "Where we're headed — new schools, cities, and partnerships on the horizon.",
          ),
          const SizedBox(height: AppSpacing.xl),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _phases.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
              childAspectRatio: isMobile ? 1.4 : 0.78,
            ),
            itemBuilder: (context, index) {
              final phase = _phases[index];
              return SlideInAnimation(
                delay: Duration(milliseconds: index * 100),
                child: AnimatedCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            phase.year,
                            style: AppTypography.headingS.copyWith(
                              fontSize: 24,
                              color: AppColors.primary,
                            ),
                          ),
                          _StatusTag(status: phase.status),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        phase.title,
                        style: AppTypography.headingS.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Expanded(
                        child: Text(
                          phase.description,
                          style: AppTypography.body.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatusTag extends StatelessWidget {
  final _PhaseStatus status;

  const _StatusTag({required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      _PhaseStatus.live => ('Live', AppColors.success),
      _PhaseStatus.inProgress => ('In Progress', AppColors.accent),
      _PhaseStatus.planned => ('Planned', AppColors.lightText),
    };
    return TagChip(label: label, color: color);
  }
}
