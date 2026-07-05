import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/misc_widgets.dart';

/// Sticky top navigation bar. Desktop shows full nav links + CTA,
/// mobile collapses to a hamburger menu.
class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onCtaPressed;
  final VoidCallback? onMenuPressed;
  final ValueChanged<String>? onNavItemTap;

  const NavBar({
    super.key,
    this.onCtaPressed,
    this.onMenuPressed,
    this.onNavItemTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.horizontalPadding(context);

    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(horizontal: hPad),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          // Logo
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.school_rounded,
                    color: AppColors.white, size: 20),
              ),
              const SizedBox(width: AppSpacing.xs),
              if (!isMobile)
                const Text(
                  AppStrings.brandName,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.text,
                  ),
                ),
            ],
          ),
          const Spacer(),
          if (!isMobile) ...[
            for (final item in AppStrings.navItems)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: HoverWidget(
                  onTap: () => onNavItemTap?.call(item), // add this
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            const SizedBox(width: AppSpacing.sm),
            PrimaryButton(label: 'Get Started', onPressed: onCtaPressed),
          ] else
            IconButton(
              onPressed: onMenuPressed,
              icon: const Icon(Icons.menu_rounded, color: AppColors.text),
            ),
        ],
      ),
    );
  }
}
