import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app_unit_testing/module/home/data/model/article_model.dart';
import 'package:news_app_unit_testing/module/home/domain/usecase/get_news_usecase.dart';
import 'package:news_app_unit_testing/module/home/presentation/provider/home_provider.dart';

class MockGetNewsUsecase extends Mock implements GetNewsUsecase {}

void main() {
  late HomeProvider sut;
  late MockGetNewsUsecase mockGetNewsUsecase;

  setUp(() {
    mockGetNewsUsecase = MockGetNewsUsecase();
    sut = HomeProvider(getNewsUsecase: mockGetNewsUsecase);
  });

  group('getting news', () {
    final articlesMock = [
      Article(title: 'Article 1', description: 'Lorem'),
      Article(title: 'Article 2', description: 'Lorem'),
    ];

    void arrangeNewsServiceReturns3Articles() {
      when(() => mockGetNewsUsecase()).thenAnswer(
        (_) async => articlesMock,
      );
    }

    test(
      "Check if the loading value change so that the UI will update",
      () async {
        //arrange
        arrangeNewsServiceReturns3Articles();
        //act
        sut.getNews();
        //assert
        expect(sut.isLoading, true);
      },
    );
    test(
      "Check if the proper article data are coming back from the usecase",
      () async {
        //arrange
        arrangeNewsServiceReturns3Articles();
        //act
        await sut.getNews();
        //assert
        expect(sut.articles, articlesMock);
        expect(sut.isLoading, false);
      },
    );
  });
}
