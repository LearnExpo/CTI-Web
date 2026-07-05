import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/misc_widgets.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';

/// Student Transformation Journey — a vertical timeline from onboarding
/// to career launch, built on the existing [TimelineItem] widget.
class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  static const _steps = [
    (
      title: 'Onboarding & Assessment',
      description:
          'We map your current skills, goals, and target career path to build a personalized plan.',
    ),
    (
      title: 'Foundation Learning',
      description:
          'Core concepts and fundamentals, taught through the Five-Layer Training Architecture.',
    ),
    (
      title: 'Skill Specialization',
      description:
          'Choose a Career School and go deep on the specific skills your target role demands.',
    ),
    (
      title: 'Industry Projects',
      description:
          'Apply what you\'ve learned to real briefs from real companies, reviewed by mentors.',
    ),
    (
      title: 'Internship',
      description:
          'A structured placement with a partner company turns your skills into real experience.',
    ),
    (
      title: 'Placement & Career Launch',
      description:
          'Our placement pipeline connects you directly to hiring partners until you land the role.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.background,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Your Path',
            title: 'Student Transformation Journey',
            subtitle:
                'From onboarding to offer letter — a guided, milestone-based path for every student.',
          ),
          const SizedBox(height: AppSpacing.xl),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 720),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < _steps.length; i++)
                    SlideInAnimation(
                      delay: Duration(milliseconds: i * 80),
                      child: TimelineItem(
                        title: _steps[i].title,
                        description: _steps[i].description,
                        isLast: i == _steps.length - 1,
                        // First step shown as "completed" to demonstrate
                        // the active-state styling — wire this to real
                        // progress data later if you add student accounts.
                        isActive: i == 0,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}