import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/responsive_builder.dart';
import '../../../../core/widgets/section_title.dart';

/// Investment Opportunity — the pitch's closing argument. Leads with
/// proof points already established in Metrics, then makes the specific
/// ask: round size, use of funds, and a CTA to talk further.
class InvestmentSection extends StatelessWidget {
  final VoidCallback? onCtaPressed;

  const InvestmentSection({super.key, this.onCtaPressed});

  static const _proofPoints = [
    '12,000+ students trained, with a 94% completion rate',
    '240+ hiring partners actively recruiting graduates',
    '88% of graduates placed within 6 months',
  ];

  static const _useOfFunds = [
    (label: 'New Career Schools & Curriculum', percent: 0.35),
    (label: 'City & International Expansion', percent: 0.30),
    (label: 'Platform & Technology', percent: 0.20),
    (label: 'Team Growth', percent: 0.15),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.dark,
      child: Column(
        children: [
          SectionTitle(
            eyebrow: 'Opportunity',
            title: 'Investment Opportunity',
            subtitle: 'Why now is the right time to back the Career Transformation Institute.',
          ),
          const SizedBox(height: AppSpacing.xl),

          // Proof points, pulled from Metrics
          Wrap(
            alignment: WrapAlignment.center,
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: [
              for (int i = 0; i < _proofPoints.length; i++)
                SlideInAnimation(
                  delay: Duration(milliseconds: i * 100),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 260),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            _proofPoints[i],
                            style: const TextStyle(color: AppColors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          // The ask + use of funds
          SlideInAnimation(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(AppRadius.lg),
                border: Border.all(color: AppColors.white.withOpacity(0.15)),
              ),
              child: ResponsiveBuilder(
                mobile: (_) => Column(
                  children: [
                    const _AskHeadline(),
                    const SizedBox(height: AppSpacing.lg),
                    const _UseOfFunds(),
                  ],
                ),
                desktop: (_) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Expanded(flex: 4, child: _AskHeadline()),
                    SizedBox(width: AppSpacing.xl),
                    Expanded(flex: 6, child: _UseOfFunds()),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),
          GradientButton(
            label: 'Request Investor Deck',
            icon: Icons.arrow_forward_rounded,
            onPressed: onCtaPressed,
          ),
        ],
      ),
    );
  }
}

class _AskHeadline extends StatelessWidget {
  const _AskHeadline();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Raising',
          style: TextStyle(color: AppColors.lightText, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4),
        Text(
          '\$5M Series A',
          style: TextStyle(color: AppColors.white, fontSize: 36, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 8),
        Text(
          'To scale to 15 cities and 3 new Career Schools over the next 24 months.',
          style: TextStyle(color: AppColors.lightText, fontSize: 14, height: 1.5),
        ),
      ],
    );
  }
}

class _UseOfFunds extends StatelessWidget {
  const _UseOfFunds();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Use of Funds',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final item in InvestmentSection._useOfFunds)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.label, style: const TextStyle(color: AppColors.white, fontSize: 13)),
                    Text('${(item.percent * 100).round()}%',
                        style: const TextStyle(color: AppColors.lightText, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: item.percent,
                    minHeight: 6,
                    backgroundColor: AppColors.white.withOpacity(0.1),
                    valueColor: const AlwaysStoppedAnimation(AppColors.accent),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}