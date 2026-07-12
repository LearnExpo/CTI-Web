import 'package:go_router/go_router.dart';
import '../features/landing/landing_page.dart';
import '../features/schools/school_detail_page.dart';
import 'app_shell.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const LandingPage(),
        ),
        GoRoute(
          path: '/schools/:schoolId',
          name: 'school-detail',
          builder: (context, state) => SchoolDetailPage(
            schoolId: state.pathParameters['schoolId']!,
          ),
        ),
      ],
    ),
  ],
);