import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  // API key loaded from environment variables (.env file)
  static String get newsApiKey => dotenv.env['NEWS_API_KEY'] ?? '';

  // Base URLs for different news endpoints
  static const String baseUrl = 'https://newsapi.org/v2';
  static const String topHeadlinesUrl = '$baseUrl/top-headlines';

  // Helper method to build URLs with API key
  static String buildUrl(String endpoint, {Map<String, String>? parameters}) {
    final uri = Uri.parse(endpoint);
    final queryParams = Map<String, String>.from(uri.queryParameters);
    queryParams['apiKey'] = newsApiKey;

    if (parameters != null) {
      queryParams.addAll(parameters);
    }

    return uri.replace(queryParameters: queryParams).toString();
  }
}
