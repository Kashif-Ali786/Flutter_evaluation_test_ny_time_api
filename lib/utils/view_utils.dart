import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(message) {
  Get.rawSnackbar(
    message: message,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(12),
    duration: const Duration(seconds: 4),
    backgroundColor: Colors.black87,
  );
}
