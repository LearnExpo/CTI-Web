import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/misc_widgets.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';

/// Success Metrics — the proof section. Numbers count up when the
/// section is built, reinforcing credibility for investors and
/// prospective students alike.
class MetricsSection extends StatelessWidget {
  const MetricsSection({super.key});

  static const _metrics = [
    (value: 12000, suffix: '+', label: 'Students trained'),
    (value: 94, suffix: '%', label: 'Course completion rate'),
    (value: 88, suffix: '%', label: 'Placed within 6 months'),
    (value: 240, suffix: '+', label: 'Hiring partners'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final columns = isMobile ? 2 : (isTablet ? 2 : 4);

    return SectionContainer(
      backgroundColor: AppColors.dark,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Proof',
            title: 'Success Metrics',
            subtitle: 'The numbers behind the outcomes we deliver for students and partners.',
          ),
          const SizedBox(height: AppSpacing.xl),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _metrics.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.lg,
              childAspectRatio: isMobile ? 1.3 : 1.6,
            ),
            itemBuilder: (context, index) {
              final metric = _metrics[index];
              return SlideInAnimation(
                delay: Duration(milliseconds: index * 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedCounter(
                      end: metric.value,
                      suffix: metric.suffix,
                      duration: const Duration(milliseconds: 1800),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      metric.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.lightText,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}