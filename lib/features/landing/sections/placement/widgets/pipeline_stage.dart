import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';
import '../../../../../core/constants/app_typography.dart';
import '../../../../../core/responsive/responsive.dart';

/// A single stage in a horizontal (desktop) or vertical (mobile) pipeline,
/// connected to the next stage by an arrow/line.
class PipelineStage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isLast;

  const PipelineStage({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final content = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(icon, color: AppColors.white, size: 26),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          title,
          textAlign: isMobile ? TextAlign.left : TextAlign.center,
          style: AppTypography.headingS.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: isMobile ? null : 140,
          child: Text(
            description,
            textAlign: isMobile ? TextAlign.left : TextAlign.center,
            style: AppTypography.body.copyWith(fontSize: 13),
          ),
        ),
      ],
    );

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.md),
        child: content,
      );
    }

    return Row(
      children: [
        Expanded(child: content),
        if (!isLast)
          const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Icon(Icons.arrow_forward_rounded,
                color: AppColors.lightText, size: 20),
          ),
      ],
    );
  }
}