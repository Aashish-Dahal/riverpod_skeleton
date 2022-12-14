import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_skeleton/app.dart';
import 'package:riverpod_skeleton/app/core/utils/assest_path.dart';
import 'package:riverpod_skeleton/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(EasyLocalization(
      startLocale: const Locale('en'),
      useOnlyLangCode: true,
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      path: AssetPath.translation,
      child: const ProviderScope(child: App())));
}
