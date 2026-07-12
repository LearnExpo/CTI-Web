import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'app/router.dart';
import 'core/theme/app_theme.dart';

void main() {
  usePathUrlStrategy(); // clean web URLs: /schools/product-management
  runApp(const CareerTransformationApp());
}

class CareerTransformationApp extends StatelessWidget {
  const CareerTransformationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Career Transformation Institute',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}