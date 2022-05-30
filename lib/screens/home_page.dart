import 'package:flutter/material.dart';
import 'package:newyork_times_assessment/screens/search_page.dart';

import 'article_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NYT"),
      ),
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
          _ArticleCategroyCard(
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
          _ArticleCategroyCard(
            title: "Most Viewed",
            onTap: () {
              gotoNewScreen(
                  ctx: context, route: ArticleListPage(category: "viewed"));
            },
          ),
          _ArticleCategroyCard(
            title: "Most Shared",
            onTap: () {
              gotoNewScreen(
                  ctx: context, route: ArticleListPage(category: "shared"));
            },
          ),
          _ArticleCategroyCard(
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

  titleWidget(text, BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(text, style: Theme.of(context).textTheme.titleSmall),
      );

  gotoNewScreen({BuildContext? ctx, Widget? route}) async {
    Navigator.push(
      ctx!,
      MaterialPageRoute(builder: (context) => route!),
    );
  }
}

class _ArticleCategroyCard extends StatelessWidget {
  final String? title;
  final void Function()? onTap;
  const _ArticleCategroyCard({Key? key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  buildDivider,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title ?? "Search Articles",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black45,
                        )),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black45,
                )
              ],
            ),
          ),
          buildDivider,
        ],
      ),
    );
  }

  Divider get buildDivider => const Divider(
        color: Colors.black38,
        height: 8,
        thickness: .5,
      );
}
