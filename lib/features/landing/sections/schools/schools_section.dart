import 'package:career_transformation_institute/core/widgets/responsive_builder.dart';
import 'package:career_transformation_institute/features/landing/sections/schools/widget/school_filter_chip.dart';
import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/section_title.dart';

/// Career Schools — a filterable grid of specialized tracks, grouped by
/// category. Reuses [FeatureCard] for each school and a new
/// [SchoolFilterChip] for category filtering.
class SchoolsSection extends StatefulWidget {
  const SchoolsSection({super.key});

  @override
  State<SchoolsSection> createState() => _SchoolsSectionState();
}

class _School {
  final String category;
  final String name;
  final String description;

  const _School({
    required this.category,
    required this.name,
    required this.description,
  });
}

class _SchoolsSectionState extends State<SchoolsSection> {
  static const _categories = [
    'All',
    'Technology',
    'Design',
    'Data & AI',
    'Business',
  ];

  static const _schools = [
    _School(
      category: 'Technology',
      name: 'School of Software Engineering',
      description: 'Full-stack development, from fundamentals to production-grade systems.',
    ),
    _School(
      category: 'Technology',
      name: 'School of Cloud & DevOps',
      description: 'Infrastructure, deployment pipelines, and cloud-native architecture.',
    ),
    _School(
      category: 'Design',
      name: 'School of Product Design',
      description: 'UX research, interaction design, and portfolio-ready case studies.',
    ),
    _School(
      category: 'Data & AI',
      name: 'School of Data Science',
      description: 'Statistics, machine learning, and real-world data pipelines.',
    ),
    _School(
      category: 'Data & AI',
      name: 'School of Applied AI',
      description: 'LLMs, applied ML systems, and production AI product development.',
    ),
    _School(
      category: 'Business',
      name: 'School of Digital Marketing',
      description: 'Growth, performance marketing, and brand strategy for the digital era.',
    ),
    _School(
      category: 'Business',
      name: 'School of Product Management',
      description: 'Roadmapping, stakeholder alignment, and shipping products that matter.',
    ),
  ];

  String _selected = 'All';

  List<_School> get _filtered => _selected == 'All'
      ? _schools
      : _schools.where((s) => s.category == _selected).toList();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);

    return SectionContainer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Programs',
            title: 'Career Schools',
            subtitle:
                'Specialized tracks aligned to in-demand career paths, taught by industry practitioners.',
          ),
          const SizedBox(height: AppSpacing.lg),

          // Filter chips
          Wrap(
            alignment: WrapAlignment.center,
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final category in _categories)
                SchoolFilterChip(
                  label: category,
                  selected: _selected == category,
                  onTap: () => setState(() => _selected = category),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),

          // School grid
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: GridView.builder(
              key: ValueKey(_selected),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filtered.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: AppSpacing.md,
                mainAxisSpacing: AppSpacing.md,
                childAspectRatio: isMobile ? 1.6 : 1.15,
              ),
              itemBuilder: (context, index) {
                final school = _filtered[index];
                return SlideInAnimation(
                  delay: Duration(milliseconds: index * 60),
                  child: FeatureCard(
                    badge: school.category,
                    title: school.name,
                    description: school.description,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}