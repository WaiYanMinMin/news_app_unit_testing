import 'package:flutter/material.dart';
import 'package:news_app_unit_testing/module/home/domain/usecase/get_news_usecase.dart';
import 'package:news_app_unit_testing/module/home/domain/usecase/get_news_usecase_impl.dart';
import 'package:news_app_unit_testing/module/home/presentation/provider/home_provider.dart';
import 'package:news_app_unit_testing/module/home/presentation/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<HomeProvider>().getNews(),
    );
  }

  final GetNewsUsecase getNewsUsecase = GetNewsUsecaseImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            elevation: 0,
            centerTitle: true,
            title: const Text('News')),
        body: Consumer<HomeProvider>(builder: (context, data, child) {
          return (data.isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemCount: data.articles.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imgUrl: data.articles[index].urlToImage ?? "",
                          title: data.articles[index].title ?? "",
                          desc: data.articles[index].description ?? "",
                          content: data.articles[index].content ?? "",
                          posturl: data.articles[index].articleUrl ?? "",
                          author: data.articles[index].author ?? "",
                          publishedAt: data.articles[index].publishedAt ?? "",
                        );
                      }),
                );
        }));
  }
}
