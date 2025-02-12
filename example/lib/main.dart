import 'package:flooding_app_auth/feature/splash/presentation/splash_presentation.dart';
import 'package:flooding_app_design_system/flooding_app_design_system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: FloodingColor.gray100,
      ),
      home: SplashPage(),
    );
  }
}
