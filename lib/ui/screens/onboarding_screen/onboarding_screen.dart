import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor_verse/core/utils/app_fonts.dart';
import 'package:noor_verse/ui/screens/home_screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF202020),
        body: Column(
          children: [
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/background_image_2.png',
                    height: 180.h,
                    width: 291.w,
                  ),
                  Positioned(
                    bottom: 30.h,
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
            50.verticalSpace,
            Image.asset(
              'assets/images/onboarding_image.png',
              height: 341.25.h,
              width: 364.67.w,
            ),
            80.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE2BE7F),
                foregroundColor: Colors.black,
                minimumSize: Size(300.w, 55.h),
                elevation: 6,
                shadowColor: Colors.black.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                'Get Started',
                style: AppFonts.arabic.copyWith(fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
