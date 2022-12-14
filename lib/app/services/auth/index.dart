import 'package:dartz/dartz.dart' show Either, left, right;
import 'package:firebase_auth/firebase_auth.dart' show FirebaseException, User;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider, Ref;
import '../../providers/general/firebase_provider.dart' show firebaseProvider;

final authServiceProvider = Provider<AuthService>((ref) => AuthService(ref));

class AuthService {
  final Ref _ref;
  AuthService(this._ref);
  Future<Either<String, User?>> firebaseLogin(
      Map<String, dynamic>? data) async {
    try {
      final response = await _ref
          .read(firebaseProvider)
          .signInWithEmailAndPassword(
              email: data!['email'], password: data['password']);
      return right(response.user!);
    } on FirebaseException catch (e) {
      return left(e.message ?? 'Login failed');
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
      return left(e.message ?? 'Login failed');
    }
  }
}
