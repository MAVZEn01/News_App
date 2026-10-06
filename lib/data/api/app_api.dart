import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/routes/network/api_result.dart';
import 'package:news_app/data/model/news_model.dart';

abstract class AppApi {
  static Future<ApiResult<NewsModel>> getNews() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=07b7e9e3ff4c4eff9723331402f233f1",
        ),
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return Success(NewsModel.fromJson(json));
    } catch (e) {
      return Error(e.toString());
    }
  }
}
