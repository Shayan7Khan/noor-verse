import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor_verse/ui/screens/home_screen/home_screen.dart';
import 'package:noor_verse/ui/screens/onboarding_screen/onboarding_screen.dart';
import 'package:noor_verse/ui/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NoorVerse',
       home: HomeScreen(),),
    );
  }
}
