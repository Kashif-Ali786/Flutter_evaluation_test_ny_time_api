import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newyork_times_assessment/controllers/article_list_controller.dart';
import 'package:newyork_times_assessment/controllers/location_controller.dart';
import 'package:newyork_times_assessment/services/api_service.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final LocationController _articleController = LocationController();

  final String? title;

  AppBarWidget({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        title: Text(title ?? ""),
        actions: [
          Text(
            "Lat:${_articleController.latitude}\nLng:${_articleController.longitude}",
            style: const TextStyle(color: Colors.grey),
          )
        ],
//      automaticallyImplyLeading: true,
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
