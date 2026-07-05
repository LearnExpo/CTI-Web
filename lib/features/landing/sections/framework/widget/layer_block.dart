import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';
import '../../../../../core/constants/app_typography.dart';

/// A single layer in the Five-Layer Training Architecture stack.
/// Width narrows as [layerIndex] increases, visually building a pyramid
/// from broad foundations up to focused career readiness.
class LayerBlock extends StatelessWidget {
  final int layerNumber;
  final int totalLayers;
  final String title;
  final String description;
  final IconData icon;
  final bool isMobile;

  const LayerBlock({
    super.key,
    required this.layerNumber,
    required this.totalLayers,
    required this.title,
    required this.description,
    required this.icon,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    // 1.0 at the base layer, shrinking toward the top layer.
    final widthFraction =
        isMobile ? 1.0 : 1.0 - ((layerNumber - 1) / totalLayers) * 0.35;

    // Color deepens slightly as layers rise, using the primary gradient's
    // two stops interpolated by layer position.
    final t = (layerNumber - 1) / (totalLayers - 1);
    final color = Color.lerp(AppColors.primary, AppColors.secondary, t)!;

    return FractionallySizedBox(
      widthFactor: widthFraction,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: color.withOpacity(0.25)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '$layerNumber',
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // layer_block.dart — inside the title Row, wrap the Text in Flexible instead of Expanded:
                  Row(
                    children: [
                      Icon(icon, size: 18, color: color),
                      const SizedBox(width: 6),
                      Flexible(
                        // was Expanded — Flexible allows it to size down, Expanded forces full width which is fine too actually, so this is a minor safety net, not a real fix
                        child: Text(
                          title,
                          style: AppTypography.headingS.copyWith(fontSize: 18),
                          overflow:
                              TextOverflow.ellipsis, // add this — the real fix
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTypography.body.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
