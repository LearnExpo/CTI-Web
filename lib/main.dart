import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/landing/landing_page.dart';

void main() {
  runApp(const CareerTransformationApp());
}

class CareerTransformationApp extends StatelessWidget {
  const CareerTransformationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Career Transformation Institute',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LandingPage(),
    );
  }
}
