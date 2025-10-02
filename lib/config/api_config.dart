// Import your API keys - this file should be in .gitignore
// If you don't have api_keys.dart, copy api_keys_template.dart and rename it
import 'api_keys.dart' show ApiKeys;

class ApiConfig {
  // API key loaded from secure file (not tracked in git)
  static const String newsApiKey = ApiKeys.newsApiKey;
  
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