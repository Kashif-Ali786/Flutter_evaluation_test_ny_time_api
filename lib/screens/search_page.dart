import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newyork_times_assessment/screens/article_list_page.dart';
import 'package:newyork_times_assessment/widgets/app_bar.dart';

class SearchPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarWidget(title: "Search Articles"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            CupertinoTextField(
              controller: controller,
              placeholder: "Search articles here",
              prefix: const Icon(CupertinoIcons.person),
              keyboardType: TextInputType.text,
              onSubmitted: (value) {
                search(context);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  search(context);
                },
                child: const Text("Search"))
          ],
        ),
      ),
    );
  }

  search(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleListPage(query: controller.text),
      ),
    );
  }


}
