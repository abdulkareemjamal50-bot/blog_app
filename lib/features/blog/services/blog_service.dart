import 'dart:convert';

import 'package:firebase/features/blog/model/news_data_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=f146a89d5b294a00b3465c25d6dffe95';

  Future<NewsData> fetchNews() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return NewsData.fromJson(data);
    } else {
      throw Exception("Fail to fetch (Status Code: ${response.statusCode})");
    }
  }
}
