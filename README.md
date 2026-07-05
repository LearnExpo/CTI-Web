# Career Transformation Institute — Flutter Starter

A feature-based Flutter starter for the Career Transformation Institute
landing page, built from the Phase 1–5 spec: product design, project
architecture, design system, reusable widgets, and the landing page flow.

## What's included

- **Design system** (`lib/core/constants`): colors, typography scale,
  8-point spacing grid, and border radii, exactly matching the Phase 3 spec.
- **Theme** (`lib/core/theme/app_theme.dart`): wires the design system into
  a Material 3 `ThemeData`.
- **Responsive helpers** (`lib/core/responsive`, `ResponsiveBuilder`,
  `SectionContainer`): mobile / tablet / desktop breakpoints used
  throughout every section.
- **Reusable widgets** (`lib/core/widgets`): Primary/Secondary/Gradient
  buttons, `SectionTitle`, `AnimatedCard`, `GlassCard`, `InfoCard`,
  `MetricCard`, `FeatureCard`, `TimelineItem`, `TagChip`,
  `AnimatedCounter`, `HoverWidget` — the full Phase 4 list.
- **Entrance animations** (`lib/core/animations`): `FadeInAnimation` and
  `SlideInAnimation`.
- **Landing page** (`lib/features/landing`): assembled per the Phase 5
  flow — Hero → Vision → Problem → Solution → Journey → Framework →
  Schools → Projects → Internships → Placement → Technology → Partners →
  Metrics → Roadmap → Investment → FAQ → Footer.
- **Hero section**: fully built out per the Phase 5 hero layout — nav bar,
  two-line gradient headline, supporting copy, primary + secondary CTAs,
  an animated gradient/particle-style background, and an illustration
  placeholder with floating glass badges (Career Schools, Internships,
  Placement) — all responsive across mobile/tablet/desktop.
- **Every other section** is scaffolded with a `PlaceholderSection` widget
  (title, eyebrow, subtitle, and a labeled content box) so the whole page
  scrolls end-to-end today. Swap each one out for a real layout
  independently — that's the point of the feature-based structure.
- A starter widget test and lint config.

## Project structure

```
lib/
├── main.dart
├── core/
│   ├── constants/      # colors, typography, spacing, strings
│   ├── theme/           # ThemeData
│   ├── responsive/      # breakpoints + helpers
│   ├── widgets/         # buttons, cards, section title, placeholder, etc.
│   └── animations/      # fade / slide entrance animations
└── features/
    └── landing/
        ├── landing_page.dart
        ├── widgets/          # NavBar
        └── sections/
            ├── hero/         # fully built
            ├── vision/
            ├── problem/
            ├── solution/
            ├── journey/
            ├── framework/
            ├── schools/
            ├── projects/
            ├── internships/
            ├── placement/
            ├── technology/
            ├── partners/
            ├── metrics/
            ├── roadmap/
            ├── investment/
            ├── faq/
            └── footer/       # fully built
```

## Getting started

This zip ships the `lib/`, `assets/`, `test/`, `pubspec.yaml`, and config
files only — it does **not** include the generated platform folders
(`android/`, `ios/`, `web/`, `macos/`, `windows/`, `linux/`), since those
are best generated fresh by the Flutter tool for your installed SDK
version.

1. Unzip the project and `cd` into it.
2. Generate the platform folders:
   ```bash
   flutter create .
   ```
   (This scaffolds `android/`, `ios/`, `web/`, etc. around the existing
   `lib/` — it won't overwrite your code.)
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run it (web is the fastest way to preview a landing page):
   ```bash
   flutter run -d chrome
   ```

## Next steps (per the Phase 5 suggested development order)

1. ✅ Project structure, design system, reusable widgets — done.
2. ✅ Landing page scaffold with placeholders for every section — done.
3. ✅ Hero section, responsive + animated — done.
4. ⬜ Replace each `PlaceholderSection` with a real layout, one at a time:
   Vision → Problem → Solution → Journey → Framework → Schools → Projects
   → Internships → Placement → Technology → Partners → Metrics → Roadmap
   → Investment → FAQ.
5. ⬜ Swap the hero's placeholder illustration
   (`hero/widgets/hero_illustration.dart`) for real artwork or a Lottie
   animation dropped into `assets/animations/lottie/`.
6. ⬜ Add a real brand font: drop `.ttf` files into `assets/fonts/`,
   uncomment the `fonts:` block in `pubspec.yaml`, and set
   `AppTypography.fontFamily`.

## Notes

- `go_router`, `flutter_animate`, `lottie`, `responsive_framework`, and
  `font_awesome_flutter` are declared in `pubspec.yaml` as convenience
  deps for the sections you'll build next (routing between a landing page
  and future pages, extra icon coverage, richer animations). None are
  required by the current code, so `flutter pub get` will work even if
  you decide to trim the list.
- `AnimatedCounter` currently starts counting on first build. When you
  build the Success Metrics section, consider pairing it with a
  visibility-detector package so counters trigger on scroll-into-view
  instead.
