import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noor_verse/core/data/dummy_quran_data.dart';
import 'package:noor_verse/core/utils/app_fonts.dart';
import 'package:noor_verse/ui/screens/detail_screen/detail_screen.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    // Filter verses based on search text
    final filteredVerses = dummyQuranVerses
        .where(
          (verse) =>
              verse.title.toLowerCase().contains(_searchText.toLowerCase()) ||
              verse.surahName.toLowerCase().contains(_searchText.toLowerCase()),
        )
        .toList();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            /// 🔹 Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/home_background.png',
                fit: BoxFit.cover,
              ),
            ),

            /// 🔹 Header with "NoorVerse" Title
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
                          color: const Color(0xFFC0A37C),
                          fontSize: 50.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔹 Search Bar
            Positioned(
              top: 192.h,
              left: 20.w,
              right: 20.w,
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
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
                  controller: _searchController,
                  cursorColor: const Color(0xFFC0A37C),
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search Surah or Verse...',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                ),
              ),
            ),

            /// 🔹 Verse List (Scrollable)
            Positioned(
              top: 250.h,
              left: 10.w,
              right: 10.w,
              bottom: 0,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filteredVerses.length,
                itemBuilder: (context, index) {
                  final verse = filteredVerses[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(
                              title: verse.title,
                              mainText: verse.arabicText,
                              translation: verse.englishTranslation,
                              verseNumber: verse.verseNumber,
                              surahName: verse.surahName,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: const Color(
                              0xFFC0A37C,
                            ).withValues(alpha: 0.7),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    verse.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "${verse.surahName} (${verse.verseNumber})",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white54,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
