import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import 'responsive_builder.dart';
import 'section_title.dart';

/// Scaffold used for sections that haven't been fully designed yet.
/// Following the Phase 5 "suggested development order," the landing page
/// wires up every section from day one with a placeholder, then each one
/// gets replaced with real content independently.
class PlaceholderSection extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;
  final Color? backgroundColor;
  final Key? sectionKey;

  const PlaceholderSection({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: backgroundColor,
      child: Column(
        children: [
          SectionTitle(eyebrow: eyebrow, title: title, subtitle: subtitle),
          const SizedBox(height: AppSpacing.lg),
          Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.border,
                style: BorderStyle.solid,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              '$title — content coming soon',
              style: const TextStyle(color: AppColors.lightText),
            ),
          ),
        ],
      ),
    );
  }
}
