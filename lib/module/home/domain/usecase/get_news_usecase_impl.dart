import 'package:news_app_unit_testing/module/home/data/repository/home_repository_impl.dart';
import 'package:news_app_unit_testing/module/home/domain/repository/home_repository.dart';
import 'package:news_app_unit_testing/module/home/domain/usecase/get_news_usecase.dart';

class GetNewsUsecaseImpl implements GetNewsUsecase {
  final HomeRepository _homeRepository = HomeRepositoryImpl();
  @override
  call() async {
    return await _homeRepository.getNews();
  }
}
