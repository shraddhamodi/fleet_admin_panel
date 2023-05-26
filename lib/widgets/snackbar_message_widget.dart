import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarMessageWidget {
  final String message;
  final int? time;
  final String? buttonText;
  final Function()? onTap;

  const SnackBarMessageWidget({
    required this.message,
    this.time = 3,
    this.buttonText = "",
    this.onTap,
  });

  static show(
    String message, {
    int? time,
    String? buttonText,
    Function()? onTap,
  }) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      mainButton: buttonText != null
          ? TextButton(onPressed: onTap ?? () {}, child: Text(buttonText))
          : const SizedBox(),
      isDismissible: true,
      duration: const Duration(seconds: 3),
    ));
  }
}
