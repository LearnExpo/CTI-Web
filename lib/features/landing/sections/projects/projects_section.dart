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

/// Industry Projects — a showcase grid of real project briefs students
/// work on, each tagged with the skills it exercises.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const _projects = [
    (
      company: 'FinTech Partner',
      title: 'Real-Time Fraud Detection Dashboard',
      description: 'Built a monitoring dashboard that flags suspicious transactions using live data streams.',
      tags: ['Data Science', 'Python', 'Dashboards'],
    ),
    (
      company: 'E-Commerce Partner',
      title: 'Checkout Conversion Redesign',
      description: 'Redesigned the checkout flow end-to-end, backed by real user testing sessions.',
      tags: ['UX Design', 'Figma', 'A/B Testing'],
    ),
    (
      company: 'Healthtech Partner',
      title: 'Patient Scheduling Platform',
      description: 'Shipped a full-stack scheduling tool used internally by a partner clinic network.',
      tags: ['Full-Stack', 'Flutter', 'APIs'],
    ),
    (
      company: 'Logistics Partner',
      title: 'Delivery Route Optimizer',
      description: 'Applied ML to cut average delivery time by optimizing route assignment.',
      tags: ['Machine Learning', 'Optimization'],
    ),
    (
      company: 'Media Partner',
      title: 'Content Performance Analytics',
      description: 'Built a reporting pipeline that tracks content performance across channels.',
      tags: ['Data Engineering', 'SQL', 'BI Tools'],
    ),
    (
      company: 'SaaS Partner',
      title: 'Onboarding Flow A/B Test',
      description: 'Designed and shipped an experiment that lifted trial-to-paid conversion.',
      tags: ['Product', 'Growth', 'Analytics'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);

    return SectionContainer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Hands-On Learning',
            title: 'Industry Projects',
            subtitle:
                'Real briefs from real companies, built into every curriculum track.',
          ),
          const SizedBox(height: AppSpacing.xl),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
              childAspectRatio: isMobile ? 1.05 : 0.82,
            ),
            itemBuilder: (context, index) {
              final project = _projects[index];
              return SlideInAnimation(
                delay: Duration(milliseconds: index * 60),
                child: AnimatedCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.company.toUpperCase(),
                        style: AppTypography.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        project.title,
                        style: AppTypography.headingS.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Expanded(
                        child: Text(
                          project.description,
                          style: AppTypography.body.copyWith(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: [
                          for (final tag in project.tags) TagChip(label: tag),
                        ],
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