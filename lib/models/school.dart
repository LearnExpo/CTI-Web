/// A single Career School track — shared across the landing page teaser
/// grid and the detail page, so there's one source of truth.
class School {
  final String id; // URL-safe slug, e.g. 'product-management'
  final bool isRegistrationStarted;
  final String category;
  final String name;
  final String shortDescription;
  final String longDescription;
  final String duration;
  final String format;
  final List<String> skills;
  final List<String> curriculum;
  final List<String> outcomes;

  const School({
    required this.id,
    this.isRegistrationStarted=false,
    required this.category,
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    required this.duration,
    required this.format,
    required this.skills,
    required this.curriculum,
    required this.outcomes,
  });
}
