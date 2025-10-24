import 'package:flutter/material.dart';
import 'package:noor_verse/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'NoorVerse', home: SplashScreen());
  }
}
