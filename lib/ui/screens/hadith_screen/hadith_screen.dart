import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor_verse/core/utils/app_fonts.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 10.h,
            child: SizedBox(
              height: 200.h,
              width: 435.w,
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
          ),
          Positioned(
            top: 192.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Color(0xFFC0A37C)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                cursorColor: Color(0xFFC0A37C),
                style: TextStyle(fontSize: 16.sp),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}