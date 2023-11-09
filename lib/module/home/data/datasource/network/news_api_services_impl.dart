import 'dart:convert';

import 'package:news_app_unit_testing/core/api/api_services.dart';
import 'package:news_app_unit_testing/core/api/api_services_impl.dart';
import 'package:news_app_unit_testing/core/errors/exception_extension.dart';
import 'package:news_app_unit_testing/module/home/data/datasource/network/news_api_services.dart';
import 'package:news_app_unit_testing/module/home/data/model/article_model.dart';

class NewsApiServicesImpl implements NewsApiServices {
  final ApiServices _apiServices = ApiServicesImpl();
  @override
  getNews() async {
    String path = "/v2/top-headlines";
    Map<String, String> params = {
      "country": "us",
      "category": "business",
      "apiKey": "fd567a1e272f4d21a30db4756deb0690"
    };
    var response = await _apiServices.get(path, params);

    var decodedJson = jsonDecode(response.body);

    if (decodedJson['status'] == 'ok') {
      Article article = Article();
      return article.fromJson(decodedJson['articles']);
    } else {
      throw ServerException();
    }
  }
}
