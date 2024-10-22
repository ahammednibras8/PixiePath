import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/splash/splash_provider.dart';
import 'package:travel_app/core/splash/splash_screen.dart';
import 'package:travel_app/core/theme/app_theme.dart';
import 'package:travel_app/features/auth/providers/login_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: const SplashScreen(),
    );
  }
}
