import 'package:news_app_unit_testing/module/home/data/datasource/network/news_api_services.dart';
import 'package:news_app_unit_testing/module/home/data/datasource/network/news_api_services_impl.dart';
import 'package:news_app_unit_testing/module/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  NewsApiServices _newsApiServices = NewsApiServicesImpl();

  @override
  getNews() async {
    return await _newsApiServices.getNews();
  }
}
