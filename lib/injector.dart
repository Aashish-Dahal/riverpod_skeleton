import 'package:easy_localization/easy_localization.dart' show EasyLocalization;
import 'package:firebase_core/firebase_core.dart' show Firebase;

Future<void> initializeDependencies() async {
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  await Firebase.initializeApp();
}
