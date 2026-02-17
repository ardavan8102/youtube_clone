import 'package:flutter/material.dart';
import 'package:youtube_clone/core/theme/app_theme.dart';
import 'package:youtube_clone/presentation/views/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube clone',
      theme: AppTheme.mainTheme,
      home: const SplashScreen(),
    );
  }
}