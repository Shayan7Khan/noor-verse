import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor_verse/core/data/dummy_hadith_data.dart';
import 'package:noor_verse/core/utils/app_fonts.dart';
import 'package:noor_verse/ui/screens/detail_screen/detail_screen.dart';


class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredHadiths = dummyHadithList
        .where((h) => h.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Header
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
                      'Hadith',
                      style: AppFonts.english.copyWith(
                        color: const Color(0xFFC0A37C),
                        fontSize: 50.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search Bar
          Positioned(
            top: 192.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFC0A37C)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                cursorColor: const Color(0xFFC0A37C),
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
              ),
            ),
          ),

          // Hadith List
          Positioned(
            top: 250.h,
            left: 0,
            right: 0,
            bottom: 0,
            child: ListView.builder(
              padding: EdgeInsets.all(16.w),
              itemCount: filteredHadiths.length,
              itemBuilder: (context, index) {
                final hadith = filteredHadiths[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(
                          title: hadith.title,
                          mainText: hadith.arabicText,
                          translation: hadith.englishTranslation,
                          reference: hadith.reference,
                          narrator: hadith.narrator,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: const Color(0xFFC0A37C)),
                    ),
                    child: Text(
                      hadith.title,
                      style: AppFonts.english.copyWith(
                        fontSize: 18.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
