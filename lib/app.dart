import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:riverpod_skeleton/app/config/themes/app_theme.dart';
import 'package:riverpod_skeleton/app/providers/router/router_provider.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      scaffoldMessengerKey: messengerKey,
      theme: AppTheme.light,
      locale: context.locale,
      title: 'Riverpod Skeleton',
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
        ...context.localizationDelegates
      ],
      supportedLocales: context.supportedLocales,
      routerConfig: router,
    );
  }
}
