import 'package:flutter/material.dart';
import 'package:firebase_flutter/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule()));
}

/// Comando para Analytics funcionar me modo Debug:
/// `adb shell setprop debug.firebase.analytics.app com.example.firebase_flutter`
