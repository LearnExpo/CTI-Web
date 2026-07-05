// lib/features/landing/widgets/mobile_nav_drawer.dart
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/buttons.dart';

/// Slide-out drawer shown on mobile when the hamburger icon is tapped.
/// Mirrors the desktop nav's links + CTA in a vertical layout.
class MobileNavDrawer extends StatelessWidget {
  final VoidCallback? onCtaPressed;
  final ValueChanged<String>? onNavItemTap;

  const MobileNavDrawer({super.key, this.onCtaPressed, this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Expanded(
                    child: Text(
                      AppStrings.brandName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              for (final item in AppStrings.navItems)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    onNavItemTap?.call(item); // add this
                  },
                ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Get Started',
                  onPressed: () {
                    Navigator.of(context).pop();
                    onCtaPressed?.call();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
