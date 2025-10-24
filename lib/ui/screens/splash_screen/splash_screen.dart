import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor_verse/core/utils/app_fonts.dart';
import 'package:noor_verse/ui/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/splash_background_image.png',
                fit: BoxFit.cover,
              ),
            ),
            //glow bulb
            Positioned(
              top: 0.h,
              left: 329.w,
              child: Image.asset('assets/images/background_image_3.png'),
            ),

            //mosque
            Positioned(
              top: 30.h,
              left: 69.w,
              right: 57.w,
              child: Image.asset('assets/images/background_image_2.png'),
            ),
            //left image
            Positioned(
              top: 187.h,
              left: 0.w,
              right: 330.w,
              child: Image.asset('assets/images/background_image_4.png'),
            ),
            //right image
            Positioned(
              top: 550.h,
              left: 329.w,
              right: 0.w,
              child: Image.asset('assets/images/background_image_5.png'),
            ),

            //bottom image
            Positioned(
              bottom: 76.h,
              left: 125.w,
              right: 125.w,
              child: Image.asset('assets/images/splash_background_2.png'),
            ),
            //center image
            Positioned(
              top: 154.86.h,
              bottom: 154.86.h,

              left: 30.w,
              right: 13,
              child: Image.asset('assets/images/background_image_6.png'),
            ),
            Positioned(
              top: 520.h,
              left: 115.w,
              child: Text(
                'NoorVerse',
                style: AppFonts.english.copyWith(
                  color: Color(0xFFC0A37C),
                  fontSize: 50.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
