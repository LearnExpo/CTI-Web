import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_typography.dart';
import 'package:visibility_detector/visibility_detector.dart'; // add this import at the top


/// Vertical step used in the Student Transformation Journey and
/// Expansion Roadmap sections.
class TimelineItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isLast;
  final bool isActive;

  const TimelineItem({
    super.key,
    required this.title,
    required this.description,
    this.isLast = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? AppColors.primary : AppColors.white,
                  border: Border.all(
                    color: AppColors.primary,
                    width: isActive ? 0 : 2,
                  ),
                ),
                child: isActive
                    ? const Icon(Icons.check, size: 12, color: AppColors.white)
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.border,
                  ),
                ),
            ],
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTypography.headingS.copyWith(fontSize: 20)),
                  const SizedBox(height: 4),
                  Text(description, style: AppTypography.body.copyWith(fontSize: 15)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small pill-shaped label used for tags/skills/categories.
class TagChip extends StatelessWidget {
  final String label;
  final Color? color;

  const TagChip({super.key, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: c.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.xl),
      ),
      child: Text(
        label,
        style: AppTypography.caption.copyWith(
          color: c,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}



// ... TimelineItem and TagChip stay unchanged ...

/// Counts up from 0 to [end] the first time it scrolls into view, using
/// [VisibilityDetector] rather than firing on build — so numbers don't
/// finish counting before the user actually sees them.
class AnimatedCounter extends StatefulWidget {
  final int end;
  final Duration duration;
  final String prefix;
  final String suffix;
  final TextStyle? style;

  const AnimatedCounter({
    super.key,
    required this.end,
    this.duration = const Duration(milliseconds: 1500),
    this.prefix = '',
    this.suffix = '',
    this.style,
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _animation;
  bool _hasStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = IntTween(begin: 0, end: widget.end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    // Intentionally NOT calling _controller.forward() here anymore —
    // it now starts from _onVisibilityChanged below instead.
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    // Fire once, when at least 40% of the widget is on screen.
    if (!_hasStarted && info.visibleFraction > 0.4) {
      _hasStarted = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('animated-counter-${widget.key ?? UniqueKey()}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Text(
            '${widget.prefix}${_animation.value}${widget.suffix}',
            style: widget.style ?? AppTypography.headingL,
          );
        },
      ),
    );
  }
}

/// Generic hover wrapper that scales its child slightly and swaps the
/// mouse cursor — useful for nav links, logos, and small tappable icons.
class HoverWidget extends StatefulWidget {
  final Widget child;
  final double scale;
  final VoidCallback? onTap;

  const HoverWidget({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.onTap,
  });

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool _hovering = false;
  

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovering ? widget.scale : 1.0,
          duration: const Duration(milliseconds: 150),
          child: widget.child,
        ),
      ),
    );
  }
}
