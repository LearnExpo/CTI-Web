import 'package:career_transformation_institute/core/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../../../core/animations/entrance_animations.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../core/widgets/section_title.dart';

/// Corporate Partners — a logo grid of the companies that hire graduates
/// and help shape the curriculum.
///
/// Ships with placeholder tiles (initials in a rounded box) since real
/// partner logos aren't available yet. Once you have them, swap each
/// [_PartnerTile] for an `Image.asset(...)` — see the note below.
class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  static const _partners = [
    'Acme Corp',
    'Nimbus Cloud',
    'Vertex Labs',
    'Northwind Retail',
    'Quantum Health',
    'Beacon Financial',
    'Horizon Media',
    'Fern Logistics',
    'Solstice AI',
    'Cobalt Systems',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);
    final columns = isMobile ? 2 : (isTablet ? 3 : 5);

    return SectionContainer(
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'Ecosystem',
            title: 'Corporate Partners',
            subtitle:
                'The companies who hire our graduates and help shape our curriculum.',
          ),
          const SizedBox(height: AppSpacing.xl),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _partners.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.sm,
              mainAxisSpacing: AppSpacing.sm,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) {
              return SlideInAnimation(
                  delay: Duration(milliseconds: index * 40),
                  child: _PartnerTile(
                    name: _partners[index],
                  ));
              // To swap in real logos later: replace the Text(widget.name, ...) in _PartnerTile with something like:
              // Image.asset(
              //   'assets/images/partners/${widget.name.toLowerCase().replaceAll(' ', '_')}.png',
              //   fit: BoxFit.contain,
              // ));
            },
          ),
        ],
      ),
    );
  }
}

class _PartnerTile extends StatefulWidget {
  final String name;

  const _PartnerTile({required this.name});

  @override
  State<_PartnerTile> createState() => _PartnerTileState();
}

class _PartnerTileState extends State<_PartnerTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: _hovering
              ? AppColors.primary.withOpacity(0.06)
              : AppColors.background,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: _hovering
                ? AppColors.primary.withOpacity(0.3)
                : AppColors.border,
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: Text(
          widget.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.caption.copyWith(
            color: _hovering ? AppColors.primary : AppColors.lightText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
