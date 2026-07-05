import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';
import '../../../../../core/widgets/cards.dart';

/// A browser-frame mockup placeholder representing the learning
/// platform's dashboard. Swap the inner content for a real screenshot
/// (`Image.asset(...)`) once product visuals are available.
class PlatformMockup extends StatelessWidget {
  const PlatformMockup({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 11,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            // Browser chrome bar
            Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
              ),
              child: Row(
                children: [
                  _dot(AppColors.lightText),
                  const SizedBox(width: 6),
                  _dot(AppColors.lightText),
                  const SizedBox(width: 6),
                  _dot(AppColors.lightText),
                ],
              ),
            ),
            // Fake dashboard body
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.background, AppColors.white],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Fake sidebar
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppRadius.sm),
                        border: Border.all(color: AppColors.border),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                      child: Column(
                        children: List.generate(
                          4,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Container(
                              width: 28,
                              height: 8,
                              decoration: BoxDecoration(
                                color: i == 0 ? AppColors.primary : AppColors.border,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    // Fake content cards
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: _fakeCard(AppColors.primary)),
                              const SizedBox(width: AppSpacing.xs),
                              Expanded(child: _fakeCard(AppColors.secondary)),
                              const SizedBox(width: AppSpacing.xs),
                              Expanded(child: _fakeCard(AppColors.accent)),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(AppRadius.sm),
                                border: Border.all(color: AppColors.border),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(Color color) => Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.4)),
      );

  Widget _fakeCard(Color color) => Container(
        height: 44,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
      );
}