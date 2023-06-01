import 'package:flutter/material.dart';

titleWidget(text, BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(text, style: Theme.of(context).textTheme.titleSmall),
    );
