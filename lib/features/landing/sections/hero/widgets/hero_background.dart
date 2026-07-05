import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

/// Subtle animated gradient blobs behind the hero copy — cheap to render
/// and avoids pulling in a particle-system dependency for the starter.
class HeroBackground extends StatefulWidget {
  const HeroBackground({super.key});

  @override
  State<HeroBackground> createState() => _HeroBackgroundState();
}

class _HeroBackgroundState extends State<HeroBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.heroBackgroundGradient),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return Stack(
            children: [
              Positioned(
                top: -120 + (t * 40),
                left: -100 + (t * 30),
                child: _blob(AppColors.primary.withOpacity(0.12), 360),
              ),
              Positioned(
                bottom: -140 - (t * 30),
                right: -120 - (t * 20),
                child: _blob(AppColors.accent.withOpacity(0.10), 420),
              ),
              Positioned(
                top: 200 - (t * 20),
                right: 40 + (t * 20),
                child: _blob(AppColors.secondary.withOpacity(0.08), 220),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _blob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
