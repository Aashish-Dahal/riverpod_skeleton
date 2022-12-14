import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

final firebaseProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
