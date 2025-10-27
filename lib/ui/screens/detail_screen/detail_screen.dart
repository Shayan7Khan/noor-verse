import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor_verse/core/utils/app_fonts.dart';

class DetailScreen extends StatelessWidget {
  final String title; // e.g. Surah name or Hadith book name
  final String mainText; // Arabic verse / Hadith text
  final String translation; // English translation
  final String? reference; // Optional (e.g. for hadith)
  final String? surahName; // e.g. "Surah Al-Baqarah"
  final int? verseNumber; // e.g. "2:255"
  final String? narrator; // Optional (for Hadith)
  final String backgroundImage;

  const DetailScreen({
    super.key,
    required this.title,
    required this.mainText,
    required this.translation,
    this.reference,
    this.surahName,
    this.verseNumber,
    this.narrator,
    this.backgroundImage = 'assets/images/home_background.png',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // 🔹 Background image
            Positioned.fill(
              child: Image.asset(backgroundImage, fit: BoxFit.cover),
            ),

            // 🔹 Foreground content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🔹 Back button + Title
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFFC0A37C),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            title,
                            style: AppFonts.english.copyWith(
                              color: Color(0xFFC0A37C),
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      38.horizontalSpace,
                    ],
                  ),

                  40.verticalSpace,

                  // 🔹 Main content container
                  Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: Color(0xFFC0A37C),
                        width: 1.2.w,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 🔸 Surah Name + Verse Number (if provided)
                        if (surahName != null || verseNumber != null)
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Text(
                              '${surahName ?? ''}${surahName != null && verseNumber != null ? ' • ' : ''}${verseNumber ?? ''}',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xFFC0A37C),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        // 🔸 Arabic / Original Text
                        Text(
                          mainText,
                          textAlign: TextAlign.center,
                          style: AppFonts.arabic.copyWith(
                            color: Color(0xFFC0A37C),
                            fontSize: 28.sp,
                            height: 1.8,
                          ),
                        ),

                        20.verticalSpace,
                        Divider(color: Color(0xFFC0A37C)),
                        20.verticalSpace,

                        // 🔸 English Translation
                        Text(
                          translation,
                          textAlign: TextAlign.center,
                          style: AppFonts.english.copyWith(
                            fontSize: 18.sp,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),

                        // 🔸 Reference (if provided)
                        if (reference != null) ...[
                          20.verticalSpace,
                          Text(
                            reference!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFFC0A37C),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],

                        // 🔸 Narrator (if provided)
                        if (narrator != null) ...[
                          10.verticalSpace,
                          Text(
                            narrator!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
