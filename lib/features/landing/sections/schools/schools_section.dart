import 'package:career_transformation_institute/core/widgets/responsive_builder.dart';
import 'package:career_transformation_institute/features/landing/sections/schools/widget/school_filter_chip.dart';
import 'package:career_transformation_institute/services/school_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/section_title.dart';
import '../../../../models/school.dart';

class SchoolsSection extends StatefulWidget {
  const SchoolsSection({super.key});

  @override
  State<SchoolsSection> createState() => _SchoolsSectionState();
}

class _SchoolsSectionState extends State<SchoolsSection> {
  String _selected = 'All';

  List<School> get _filtered => _selected == 'All'
      ? SchoolsRepository.all
      : SchoolsRepository.all.where((s) => s.category == _selected).toList();

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
          Wrap(
            alignment: WrapAlignment.center,
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final category in SchoolsRepository.categories)
                SchoolFilterChip(
                  label: category,
                  selected: _selected == category,
                  onTap: () => setState(() => _selected = category),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
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
                    isRegistrationStarted: school.isRegistrationStarted,
                    badge: school.category,
                    title: school.name,
                    description: school.shortDescription,
                    onTap: () =>
                        context.push('/schools/${school.id}'), // navigate
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
