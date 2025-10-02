import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trendo/models/article_model.dart';
import 'package:trendo/config/api_config.dart';
import 'package:http/http.dart' as http;

//API calling karenge and data lenge yaha par
class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = ApiConfig.buildUrl(
      "https://newsapi.org/v2/top-headlines",
      parameters: {"sources": "techcrunch"},
    );

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            desc: element['description'],
            urlToImage: element['urlToImage'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
