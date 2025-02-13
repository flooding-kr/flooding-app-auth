import 'package:flooding_app_auth/router.dart';
import 'package:flooding_app_design_system/flooding_app_design_system.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: FloodingColor.gray100,
      ),
      routerConfig: AuthRouter.router
    );
  }
}
