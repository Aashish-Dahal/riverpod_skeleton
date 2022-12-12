import 'package:flutter/material.dart';
import 'package:riverpod_skeleton/app/config/routes/app_routes.dart';
import 'package:riverpod_skeleton/app/config/themes/app_theme.dart';

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: _messengerKey,
      theme: AppTheme.light,
      title: 'Riverpod Skeleton',
      darkTheme: AppTheme.dark,
      routerConfig: AppRoutes.router,
    );
  }
}
