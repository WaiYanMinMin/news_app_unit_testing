// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String postUrl;
  const ArticleWebView({
    Key? key,
    required this.postUrl,
  }) : super(key: key);

  @override
  ArticleWebViewState createState() => ArticleWebViewState();
}

class ArticleWebViewState extends State<ArticleWebView> {
  int progress = 0;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          centerTitle: true,
          title: const Text('News')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            WebView(
              onPageFinished: (url) {
                setState(() {
                  progress = 100;
                });
              },
              initialUrl: widget.postUrl,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
            ),
            (progress != 100)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
