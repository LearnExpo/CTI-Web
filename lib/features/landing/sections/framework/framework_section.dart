import 'package:career_transformation_institute/core/widgets/responsive_builder.dart';
import 'package:career_transformation_institute/features/landing/sections/framework/widget/layer_block.dart';
import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/section_title.dart';

/// Five-Layer Training Architecture — a pyramid stack that narrows from
/// broad foundations at the base to focused career readiness at the top.
class FrameworkSection extends StatelessWidget {
  const FrameworkSection({super.key});

  // Ordered top (layer 1, most advanced) to bottom (layer 5, foundation)
  // for display purposes — we reverse it so the base renders widest.
  static const _layers = [
    (
      title: 'Foundations',
      description: 'Core concepts, tools, and the mindset every specialization builds on.',
      icon: Icons.foundation_rounded,
    ),
    (
      title: 'Applied Skills',
      description: 'Hands-on technical training that turns theory into working ability.',
      icon: Icons.build_rounded,
    ),
    (
      title: 'Real Projects',
      description: 'Industry-aligned project work, reviewed by mentors and practitioners.',
      icon: Icons.integration_instructions_rounded,
    ),
    (
      title: 'Specialization',
      description: 'Deep, career-school-specific training in your chosen path.',
      icon: Icons.workspace_premium_rounded,
    ),
    (
      title: 'Career Readiness',
      description: 'Portfolio, interview prep, and soft skills to close the deal.',
      icon: Icons.emoji_events_rounded,
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
            eyebrow: 'Curriculum',
            title: 'Five-Layer Training Architecture',
            subtitle:
                'Five progressive layers that take students from fundamentals to job-ready expertise.',
          ),
          const SizedBox(height: AppSpacing.xl),
          Column(
            // Layer 1 (Foundations) renders at the bottom/widest, so we
            // reverse the display order while keeping layerNumber = 1
            // for Foundations, consistent with the written architecture.
            children: [
              for (int i = _layers.length - 1; i >= 0; i--)
                SlideInAnimation(
                  delay: Duration(milliseconds: (_layers.length - 1 - i) * 100),
                  child: Center(
                    child: LayerBlock(
                      layerNumber: i + 1,
                      totalLayers: _layers.length,
                      title: _layers[i].title,
                      description: _layers[i].description,
                      icon: _layers[i].icon,
                      isMobile: isMobile,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}