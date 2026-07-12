import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_colors.dart';
import '../features/landing/widgets/mobile_nav_drawer.dart';
import '../features/landing/widgets/nav_bar.dart';
import 'home_scroll_controller.dart';

class AppShell extends StatefulWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _goToSection(String section) {
    final location = GoRouterState.of(context).uri.toString();
    if (location != '/') {
      context.go('/'); // navigate home first if we're on another page
    }
    homeScrollController.requestScroll(section); // always fires
  }

  void _handleNavTap(String item) {
    final section = switch (item) {
      'About' => 'about',
      'Schools' => 'schools',
      'Partners' => 'partners',
      'Contact' => 'contact',
      'Journey' => 'journey',
      'Investment' => 'investment',
      _ => null,
    };
    if (section != null) _goToSection(section);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      appBar: NavBar(
        onCtaPressed: () => _goToSection('schools'),
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onNavItemTap: _handleNavTap,
      ),
      drawer: MobileNavDrawer(
        onCtaPressed: () => _goToSection('schools'),
        onNavItemTap: _handleNavTap,
      ),
      body: widget.child,
    );
  }
}