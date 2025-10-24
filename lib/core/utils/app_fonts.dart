import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  //arabic text
  static  TextStyle arabic = TextStyle(
    fontFamily: 'JannahLT',
    fontSize: 35.sp,
    fontWeight: FontWeight.bold,
  );

  // English translation
  static  TextStyle english = TextStyle(
    fontFamily: 'Kamali',
    fontSize: 18,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  // Surah name and verse number
  static  TextStyle meta = TextStyle(
    fontFamily: 'Kamali',
    color: Colors.grey[600],
    fontSize: 14,
  );
}
