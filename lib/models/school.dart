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

 factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as String,
      isRegistrationStarted: json['isRegistrationStarted'] as bool,
      category: json['category'] as String,
      name: json['name'] as String,
      shortDescription: json['short_description'] as String,
      longDescription: json['long_description'] as String,
      duration: json['duration'] as String,
      format: json['format'] as String,
      skills: List<String>.from(json['skills'] as List? ?? []),
      curriculum: List<String>.from(json['curriculum'] as List? ?? []),
      outcomes: List<String>.from(json['outcomes'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'isRegistrationStarted': isRegistrationStarted,
        'category': category,
        'name': name,
        'short_description': shortDescription,
        'long_description': longDescription,
        'duration': duration,
        'format': format,
        'skills': skills,
        'curriculum': curriculum,
        'outcomes': outcomes,
      };
}