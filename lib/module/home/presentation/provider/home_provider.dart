// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app_unit_testing/module/home/data/model/article_model.dart';
import 'package:news_app_unit_testing/module/home/domain/usecase/get_news_usecase.dart';

class HomeProvider extends ChangeNotifier {
  final GetNewsUsecase getNewsUsecase;
  HomeProvider({
    required this.getNewsUsecase,
  });

  List<Article> _articles = [];

  List<Article> get articles => _articles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getNews() async {
    try {
      _isLoading = true;
      notifyListeners();
      _articles = await getNewsUsecase();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
