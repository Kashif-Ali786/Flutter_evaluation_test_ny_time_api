import 'package:flutter/material.dart';
import 'package:newyork_times_assessment/screens/search_page.dart';
import 'package:newyork_times_assessment/widgets/app_bar.dart';
import 'package:newyork_times_assessment/widgets/article_card.dart';
import 'package:newyork_times_assessment/widgets/tile_widget.dart';

import 'article_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "NYT"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          titleWidget("Search", context),
          const Divider(
            color: Colors.black38,
            height: 8,
            thickness: .5,
          ),
          ArticleCategroyCard(
            onTap: () {
              gotoNewScreen(ctx: context, route: SearchPage());
            },
          ),
          const SizedBox(height: 60),
          titleWidget("Popular", context),
          const Divider(
            color: Colors.black38,
            height: 8,
            thickness: .5,
          ),
          ArticleCategroyCard(
            title: "Most Viewed",
            onTap: () {
              gotoNewScreen(
                  ctx: context, route: ArticleListPage(category: "viewed"));
            },
          ),
          ArticleCategroyCard(
            title: "Most Shared",
            onTap: () {
              gotoNewScreen(
                  ctx: context, route: ArticleListPage(category: "shared"));
            },
          ),
          ArticleCategroyCard(
            title: "Most Emailed",
            onTap: () {
              gotoNewScreen(
                  ctx: context, route: ArticleListPage(category: "emailed"));
            },
          ),
        ],
      ),
    );
  }

  gotoNewScreen({BuildContext? ctx, Widget? route}) async {
    Navigator.push(
      ctx!,
      MaterialPageRoute(builder: (context) => route!),
    );
  }
}
