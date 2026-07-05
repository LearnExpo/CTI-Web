import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/responsive_builder.dart';

/// Site footer — brand, quick links, and legal line.
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.dark,
      verticalPadding: const EdgeInsets.symmetric(vertical: 56),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.school_rounded,
                                  color: AppColors.white, size: 18),
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            const Text(
                              AppStrings.brandName,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 320),
                          child: Text(
                            'Building the next generation of industry-ready talent.',
                            textAlign:
                                isMobile ? TextAlign.center : TextAlign.left,
                            style: const TextStyle(color: AppColors.lightText),
                          ),
                        ),
                      ],
                    )
                  : Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.school_rounded,
                                    color: AppColors.white, size: 18),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              const Text(
                                AppStrings.brandName,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 320),
                            child: Text(
                              'Building the next generation of industry-ready talent.',
                              textAlign:
                                  isMobile ? TextAlign.center : TextAlign.left,
                              style:
                                  const TextStyle(color: AppColors.lightText),
                            ),
                          ),
                        ],
                      ),
                    ),
              if (!isMobile) const Spacer(),
              if (isMobile) const SizedBox(height: AppSpacing.lg),
              _FooterLinkColumn(
                title: 'Company',
                links: const ['About', 'Careers', 'Contact'],
                center: isMobile,
              ),
              if (isMobile) const SizedBox(height: AppSpacing.lg),
              _FooterLinkColumn(
                title: 'Programs',
                links: const ['Career Schools', 'Internships', 'Placement'],
                center: isMobile,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          const Divider(color: AppColors.lightText),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '© ${DateTime.now().year} ${AppStrings.brandName}. All rights reserved.',
            style: const TextStyle(color: AppColors.lightText, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _FooterLinkColumn extends StatelessWidget {
  final String title;
  final List<String> links;
  final bool center;

  const _FooterLinkColumn({
    required this.title,
    required this.links,
    this.center = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        for (final link in links)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              link,
              style: const TextStyle(color: AppColors.lightText),
            ),
          ),
      ],
    );
  }
}
