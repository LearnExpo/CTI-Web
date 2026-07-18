/// Central place for environment-dependent values. Swap [current] to
/// point at staging/prod, or wire this up to --dart-define at build time.
enum Environment { mock, staging, production }

class Env {
  Env._();

  static const Environment current = Environment.mock; // flip when backend is ready

  static String get baseUrl => switch (current) {
        Environment.mock => '', // unused — mock repository doesn't hit the network
        Environment.staging => 'https://staging-api.careertransform.example/v1',
        Environment.production => 'https://api.careertransform.example/v1',
      };

  static bool get useMockData => current == Environment.mock;
}