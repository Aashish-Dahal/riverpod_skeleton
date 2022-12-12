import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/app/config/routes/route_path.dart';
import 'package:riverpod_skeleton/app/pages/auth/login_page.dart';
import 'package:riverpod_skeleton/app/pages/auth/register_page.dart';

class AppRoutes {
  static final router = GoRouter(initialLocation: RoutePath.login, routes: [
    GoRoute(
      path: RoutePath.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RoutePath.login,
      builder: (context, state) => const RegisterPage(),
    ),
  ]);
}
