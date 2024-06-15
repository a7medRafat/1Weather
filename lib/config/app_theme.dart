import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: AppColors.appBackground,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0,
          titleTextStyle:
          TextStyle(color: AppColors.primaryColor, fontSize: 15.sp)),
      textTheme: TextTheme(
        headlineLarge: (TextStyle(
            fontSize: 120,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times',
            color: AppColors.primaryColor,
            height: 0.8.h)),
        bodyLarge: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times',
            color: AppColors.primaryColor),
        bodyMedium:  TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times',
            color: Colors.white),
        bodySmall:  TextStyle(
            color: Colors.white70,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times'),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ));
}
