import 'package:flutter/material.dart';
import 'package:riverpod_skeleton/app.dart';
import 'package:riverpod_skeleton/app/core/utils/app_colors.dart';

enum SnackBarPosition { top, bottom }

showSuccess(
    {String? message, SnackBarPosition position = SnackBarPosition.top}) {
  _snackBar(
      icon: Icons.check_circle_outline,
      backgroundColor: Colors.green,
      message: message ?? 'Success');
}

showError({String? message, SnackBarPosition position = SnackBarPosition.top}) {
  _snackBar(
      icon: Icons.info_outline,
      backgroundColor: Colors.red,
      message: message ?? 'Error');
}

showInfo({String? message, SnackBarPosition position = SnackBarPosition.top}) {
  _snackBar(
      icon: Icons.info_outline,
      backgroundColor: AppColors.purple,
      message: message ?? 'Information');
}

_snackBar({
  required IconData icon,
  Color? iconColor,
  required Color backgroundColor,
  required String message,
  EdgeInsets? contentPadding,
  SnackBarPosition position = SnackBarPosition.top,
  int? maxLines,
  TextStyle? style,
}) {
  messengerKey.currentState!.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.up,
      backgroundColor: backgroundColor,
      margin: EdgeInsets.only(
          left: 10,
          bottom: (position == SnackBarPosition.top)
              ? MediaQuery.of(messengerKey.currentContext!).size.height - 150
              : 10,
          right: 10),
      content: Padding(
        padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? AppColors.white,
            ),
            const SizedBox(width: 8),
            Text(
              message,
              maxLines: maxLines,
              softWrap: true,
              style: style ?? const TextStyle(color: AppColors.white),
            )
          ],
        ),
      )));
}
