import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';
import 'widgets/pipeline_stage.dart';

/// Placement Pipeline — the structured hand-off from internship
/// completion to a full-time offer.
class PlacementSection extends StatelessWidget {
  const PlacementSection({super.key});

  static const _stages = [
    (
      icon: Icons.description_rounded,
      title: 'Readiness Review',
      description: 'Portfolio and resume reviewed against partner hiring bars.',
    ),
    (
      icon: Icons.record_voice_over_rounded,
      title: 'Mock Interviews',
      description: 'Technical and behavioral practice with real feedback.',
    ),
    (
      icon: Icons.diversity_3_rounded,
      title: 'Employer Matching',
      description:
          'Introduced to hiring partners actively looking to fill roles.',
    ),
    (
      icon: Icons.celebration_rounded,
      title: 'Offer & Onboarding',
      description: 'Support through offer negotiation and your first day.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Outcomes',
            title: 'Placement Pipeline',
            subtitle:
                'A dedicated pipeline connecting graduates directly to hiring partners.',
          ),
          const SizedBox(height: AppSpacing.xl),

          ResponsiveBuilder(
            mobile: (_) => Column(
              children: [
                for (int i = 0; i < _stages.length; i++)
                  SlideInAnimation(
                    delay: Duration(milliseconds: i * 100),
                    child: PipelineStage(
                      icon: _stages[i].icon,
                      title: _stages[i].title,
                      description: _stages[i].description,
                      isLast: i == _stages.length - 1,
                    ),
                  ),
              ],
            ),
            desktop: (_) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < _stages.length; i++)
                  Expanded(
                    child: SlideInAnimation(
                      delay: Duration(milliseconds: i * 100),
                      child: PipelineStage(
                        icon: _stages[i].icon,
                        title: _stages[i].title,
                        description: _stages[i].description,
                        isLast: i == _stages.length - 1,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Supporting stat
          const SlideInAnimation(
            child: MetricCard(
              value: '92%',
              label:
                  'of graduates who complete the pipeline are placed within 90 days',
            ),
          ),
        ],
      ),
    );
  }
}
