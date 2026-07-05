import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';
import '../../../../../core/widgets/cards.dart';

/// Placeholder for the "Career Growth Ecosystem" illustration called out
/// in the Phase 5 hero layout. Swap the center icon / background for a
/// real illustration or Lottie animation (assets/animations/lottie) once
/// you have final art.
class HeroIllustration extends StatelessWidget {
  const HeroIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(AppRadius.lg * 2),
            ),
          ),
          const Icon(
            Icons.auto_awesome_rounded,
            color: AppColors.white,
            size: 96,
          ),
          Positioned(
            top: 24,
            left: 12,
            child: GlassCard(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.school_rounded, color: AppColors.white, size: 18),
                  SizedBox(width: 6),
                  Text('Career Schools',
                      style: TextStyle(color: AppColors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 32,
            right: 8,
            child: GlassCard(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.work_rounded, color: AppColors.white, size: 18),
                  SizedBox(width: 6),
                  Text('Internships',
                      style: TextStyle(color: AppColors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            left: -4,
            child: GlassCard(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.flag_circle_rounded, color: AppColors.white, size: 18),
                  SizedBox(width: 6),
                  Text('Placement',
                      style: TextStyle(color: AppColors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
