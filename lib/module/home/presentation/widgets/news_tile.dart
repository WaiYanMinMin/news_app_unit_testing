import 'package:flutter/material.dart';
import 'package:news_app_unit_testing/module/home/presentation/pages/article_web_view.dart';

class NewsTile extends StatefulWidget {
  final String imgUrl, title, desc, content, posturl, author;
  final String publishedAt;

  const NewsTile(
      {Key? key,
      required this.imgUrl,
      required this.desc,
      required this.title,
      required this.content,
      required this.posturl,
      required this.author,
      required this.publishedAt})
      : super(key: key);

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleWebView(
                      postUrl: widget.posturl,
                    )));
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        widget.imgUrl,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey,
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                ]),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  widget.title,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.desc,
                  maxLines: 2,
                )
              ],
            ),
          )),
    );
  }
}
