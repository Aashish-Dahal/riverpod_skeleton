import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/app.dart';
import 'package:riverpod_skeleton/app/pages/home/home_navigator.dart';
import 'package:riverpod_skeleton/app/pages/home/home_page.dart';

import '../../config/routes/route_name.dart';
import '../../config/routes/route_path.dart';
import '../../pages/auth/login_page.dart';
import '../../pages/auth/register_page.dart';
import '../../pages/home/profile_page.dart';
import '../../pages/home/setting_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: RoutePath.login,
      debugLogDiagnostics: true,
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
            name: RouteName.login,
            path: RoutePath.login,
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                name: RouteName.register,
                path: RoutePath.register,
                builder: (context, state) => const RegisterPage(),
              ),
            ]),
        ShellRoute(
            navigatorKey: shellNavigatorKey,
            pageBuilder: (context, state, child) => NoTransitionPage(
                child: HomeNavigator(key: state.pageKey, child: child)),
            routes: [
              GoRoute(
                name: RouteName.home,
                path: RoutePath.home,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
              ),
              GoRoute(
                name: RouteName.profile,
                path: RoutePath.profile,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
              GoRoute(
                name: RouteName.setting,
                path: RoutePath.setting,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingPage()),
              ),
            ])
      ]);
});
