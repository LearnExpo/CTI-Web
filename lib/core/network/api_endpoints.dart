/// Every backend path in one place — no magic strings scattered across
/// repositories.
class ApiEndpoints {
  ApiEndpoints._();

  static const schools = '/schools';
  static String schoolById(String id) => '/schools/$id';

  static const partners = '/partners';
  static const projects = '/projects';

  static const contactForm = '/contact';
  static const investorRequest = '/investors/request-deck';
  static const newsletterSignup = '/newsletter/subscribe';
}