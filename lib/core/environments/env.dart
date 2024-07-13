/// App Environment
sealed class Env {
  /// TMDB API Key from Dart Define Environment
  static String apiKey = const String.fromEnvironment(
    'API_KEY',
    defaultValue: '',
  );
}
