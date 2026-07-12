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
import '../../app/home_scroll_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _schoolsKey = GlobalKey();
  final GlobalKey _partnersKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _investmentKey = GlobalKey();

  int _lastHandledRequestId = -1;

  @override
  void initState() {
    super.initState();
    homeScrollController.addListener(_onScrollRequest);
    // Handles the case where a request was made just before this page
    // mounted (e.g. navigating here from a school detail page).
    WidgetsBinding.instance.addPostFrameCallback((_) => _onScrollRequest());
  }

  @override
  void dispose() {
    homeScrollController.removeListener(_onScrollRequest);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollRequest() {
    if (homeScrollController.requestId == _lastHandledRequestId) return;
    final target = homeScrollController.target;
    if (target == null) return;
    _lastHandledRequestId = homeScrollController.requestId;
    // Wait a frame so section widgets are laid out before we measure them.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToKey(_keyFor(target));
    });
  }

  GlobalKey _keyFor(String section) => switch (section) {
        'about' => _aboutKey,
        'schools' => _schoolsKey,
        'partners' => _partnersKey,
        'contact' => _contactKey,
        'journey' => _journeyKey,
        'investment' => _investmentKey,
        _ => _aboutKey,
      };

  void _scrollToKey(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
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
              child: const Text('Got it')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              onPrimaryCta: () => _scrollToKey(_schoolsKey),
              onSecondaryCta: () => _scrollToKey(_schoolsKey),
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
        onPressed: () => _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        ),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.arrow_upward_rounded, color: Colors.white),
      ),
    );
  }
}
