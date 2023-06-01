import 'package:flutter/material.dart';

class ArticleCategroyCard extends StatelessWidget {
  final String? title;
  final void Function()? onTap;
  const ArticleCategroyCard({Key? key, this.title, this.onTap})
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
