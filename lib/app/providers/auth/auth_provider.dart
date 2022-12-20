import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_skeleton/app/providers/auth/state/index.dart';
import 'package:riverpod_skeleton/app/services/auth/index.dart';

final loginNotifierProvider = StateNotifierProvider.autoDispose<
    LoginNotifierProvider,
    AuthenticationState>((ref) => LoginNotifierProvider(ref));
final registerNotifierProvider = StateNotifierProvider.autoDispose<
    RegisterNotifierProvider,
    AuthenticationState>((ref) => RegisterNotifierProvider(ref));

class LoginNotifierProvider extends StateNotifier<AuthenticationState> {
  final Ref _ref;
  LoginNotifierProvider(this._ref) : super(const AuthenticationState.initial());

  Future<void> firebaseLogin(Map<String, dynamic>? data) async {
    state = const AuthenticationState.loading();
    final response = await _ref.read(authServiceProvider).firebaseLogin(data);
    state = response.fold(
        (error) => AuthenticationState.unauthenticated(message: error),
        (res) => AuthenticationState.authenticated(user: res!));
  }
}

class RegisterNotifierProvider extends StateNotifier<AuthenticationState> {
  final Ref _ref;
  RegisterNotifierProvider(this._ref)
      : super(const AuthenticationState.initial());

  Future<void> firebaseRegister(Map<String, dynamic>? data) async {
    state = const AuthenticationState.loading();
    final response =
        await _ref.read(authServiceProvider).firebaseRegister(data);
    state = response.fold(
        (error) => AuthenticationState.unauthenticated(message: error),
        (res) => AuthenticationState.authenticated(user: res!));
  }
}
