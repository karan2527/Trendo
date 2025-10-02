import 'dart:convert';

import 'package:trendo/models/show_category.dart';
import 'package:trendo/config/api_config.dart';
import 'package:http/http.dart' as http;

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String category) async {
    String url = ApiConfig.buildUrl(
      "https://newsapi.org/v2/top-headlines",
      parameters: {"country": "us", "category": category},
    );
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            title: element['title'],
            desc: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
          );
          categories.add(showCategoryModel);
        }
      });
    }
  }
}
