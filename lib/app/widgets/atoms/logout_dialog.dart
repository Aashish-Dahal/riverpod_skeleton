import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart'
    show
        AlertDialog,
        BuildContext,
        EdgeInsets,
        MainAxisAlignment,
        Text,
        TextAlign,
        TextButton,
        Theme,
        showDialog;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Consumer;
import '../../services/auth/index.dart' show authServiceProvider;

Future logoutDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      titlePadding: const EdgeInsets.only(top: 25),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      title: const Text(
        "Are you sure you want to logout?",
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.subtitle1,
            )),
        Consumer(builder: (context, ref, child) {
          return TextButton(
              onPressed: () {
                ref.watch(authServiceProvider).logout();
              },
              child: Text(
                tr('logout'),
                style: Theme.of(context).textTheme.subtitle1,
              ));
        })
      ],
    ),
  );
}
