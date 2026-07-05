import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'sections/faq/faq_section.dart';
import 'sections/footer/footer_section.dart';
import 'sections/framework/framework_section.dart';
import 'sections/hero/hero_section.dart';
import 'sections/internships/internships_section.dart';
import 'sections/investment/investment_section.dart';
import 'sections/journey/journey_section.dart';
import 'sections/metrics/metrics_section.dart';
import 'sections/partners/partners_section.dart';
import 'sections/placement/placement_section.dart';
import 'sections/problem/problem_section.dart';
import 'sections/projects/projects_section.dart';
import 'sections/roadmap/roadmap_section.dart';
import 'sections/schools/schools_section.dart';
import 'sections/solution/solution_section.dart';
import 'sections/technology/technology_section.dart';
import 'sections/vision/vision_section.dart';
import 'widgets/nav_bar.dart';
import 'widgets/mobile_nav_drawer.dart';

/// Assembles the full landing page, per the Phase 5 flow:
///
/// LandingPage
///     ├── HeroSection()
///     ├── VisionSection()
///     ├── ProblemSection()
///     ├── SolutionSection()
///     ├── JourneySection()
///     ├── FrameworkSection()
///     ├── SchoolsSection()
///     ├── ProjectsSection()
///     ├── InternshipSection()
///     ├── PlacementSection()
///     ├── TechnologySection()
///     ├── PartnersSection()
///     ├── MetricsSection()
///     ├── RoadmapSection()
///     ├── InvestmentSection()
///     ├── FAQSection()
///     └── FooterSection()
///
/// Only [HeroSection] is fully designed for this first milestone; the rest
/// render as labeled placeholders so the whole page can be reviewed and
/// scrolled end-to-end, then filled in one section at a time.
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // add these — one per nav item, mapped to the closest matching section
  final GlobalKey _aboutKey = GlobalKey(); // -> Vision
  final GlobalKey _schoolsKey = GlobalKey(); // -> Schools
  final GlobalKey _partnersKey = GlobalKey(); // -> Partners
  final GlobalKey _contactKey = GlobalKey(); // -> Footer
  final GlobalKey _journeyKey = GlobalKey(); // add
  final GlobalKey _investmentKey = GlobalKey(); // add

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  void _scrollToKey(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleNavTap(String item) {
    final key = switch (item) {
      'About' => _aboutKey,
      'Schools' => _schoolsKey,
      'Partners' => _partnersKey,
      'Contact' => _contactKey,
      'Journey'=> _journeyKey,
      'Investment'=>_investmentKey,
      _ => null,
    };
    if (key != null) _scrollToKey(key);
  }

  void _showComingSoonDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      appBar: NavBar(
        onCtaPressed: () =>
            _scrollToKey(_schoolsKey), // "Get Started" -> Schools
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onNavItemTap: _handleNavTap,
      ),
      drawer: MobileNavDrawer(
        onCtaPressed: () =>
            _scrollToKey(_schoolsKey), // same destination as desktop nav
        onNavItemTap: _handleNavTap,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              onPrimaryCta: () =>
                  _scrollToKey(_schoolsKey), // "Start Your Journey" -> Schools
              onSecondaryCta: () => _scrollToKey(
                  _schoolsKey), // "Explore Career Schools" -> Schools
            ),
            VisionSection(key: _aboutKey),
            const ProblemSection(),
            const SolutionSection(),
            JourneySection(key: _journeyKey),
            const FrameworkSection(),
            SchoolsSection(key: _schoolsKey),
            const ProjectsSection(),
            const InternshipsSection(),
            const PlacementSection(),
            const TechnologySection(),
            PartnersSection(key: _partnersKey),
            const MetricsSection(),
            const RoadmapSection(),
            InvestmentSection(
              key: _investmentKey,
              onCtaPressed: () => _showComingSoonDialog(
                'Investor Deck',
                'Thanks for your interest! Drop us a note at invest@careertransform.example and we\'ll send the full deck over.',
              ),
            ),
            const FaqSection(),
            FooterSection(key: _contactKey),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: _scrollToTop,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.arrow_upward_rounded, color: Colors.white),
      ),
    );
  }
}
