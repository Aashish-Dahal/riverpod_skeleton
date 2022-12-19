import 'package:dartz/dartz.dart' show Either, left, right;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseException, User;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Provider, Ref, StreamProvider;
import '../../providers/general/firebase_provider.dart' show firebaseProvider;

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref));
final authStateServiceProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChange);

class AuthService {
  final Ref _ref;
  AuthService(this._ref);
  Stream<User?> get authStateChange =>
      _ref.read(firebaseProvider).authStateChanges();
  Future<Either<String, User?>> firebaseLogin(
      Map<String, dynamic>? data) async {
    try {
      final response = await _ref
          .read(firebaseProvider)
          .signInWithEmailAndPassword(
              email: data!['email'], password: data['password']);
      return right(response.user!);
    } on FirebaseException catch (e) {
      if (e.code == 'wrong-password') {
        return left('Wrong Password');
      } else if (e.code == 'user-not-found') {
        return left('User not found');
      } else {
        return left('Login failed');
      }
    }
  }

  Future<Either<String, User?>> firebaseRegister(
      Map<String, dynamic>? data) async {
    try {
      final response = await _ref
          .read(firebaseProvider)
          .createUserWithEmailAndPassword(
              email: data!['email'], password: data['password']);
      return right(response.user!);
    } on FirebaseException catch (e) {
      print(e.code);
      return left(e.message ?? 'Register failed');
    }
  }

  Future<void> logout() async {
    await _ref.read(firebaseProvider).signOut();
  }
}
