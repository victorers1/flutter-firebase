import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Asserts Firebase is running
  await Firebase.initializeApp();

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(ModularApp(module: AppModule()));
}
