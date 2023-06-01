import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newyork_times_assessment/controllers/article_list_controller.dart';
import 'package:newyork_times_assessment/models/article_model.dart';
import 'package:newyork_times_assessment/services/api_service.dart';
import 'package:newyork_times_assessment/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleListPage extends StatefulWidget {
  final String? category, query;

  ArticleListPage({Key? key, this.category, this.query}) : super(key: key);

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  final ArticleController _articleController = ArticleController(APIService());

  @override
  void initState() {
    super.initState();
    _articleController.getArticles(
        query: widget.query, category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Articles"),
      body: Obx(() {
        return NotificationListener(
          onNotification: (ScrollNotification scrollInfo) {
            if (!_articleController.showMoreLoadingProgress &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                _articleController.isMoreDataAvailable) {
              _articleController.loadMoreArticles(widget.query);
            }
            return true;
          },
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 10.0),
              Center(
                child: Text(
                  widget.query != null
                      ? "Results for '${widget.query}'"
                      : 'The New York Times\n${widget.category!.toUpperCase()} articles',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              _articleController.showProgress == false
                  ? Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          if (_articleController.articles.isEmpty)
                            const Text("No Article found."),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(
                                _articleController.articles.length, (index) {
                              var result = _articleController.articles[index];
                              return Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.all(8.0),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 1),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        result.title ?? "Empty",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          DateFormat('dd-MM-yyyy hh:mm a')
                                              .format(result.publishedDate!),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                          _articleController.showMoreLoadingProgress
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    key: Key('progress-indicator'),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    )
                  //_buildArticlesList()
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
