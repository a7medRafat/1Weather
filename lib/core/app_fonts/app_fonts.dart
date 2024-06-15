import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
  static double _scaleFactor = 1.0;

  static double get scaleFactor => _scaleFactor;

  static void setScaleFactor(BuildContext context) {
    ScreenUtil.init(context);
    _scaleFactor = ScreenUtil().scaleHeight;
  }

  static TextStyle getTextStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? background,
    Paint? foreground,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize != null ? ScreenUtil().setSp(fontSize) : null,
      fontWeight: fontWeight,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      background: background,
      foreground: foreground,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFamily: fontFamily,
    );
  }
}
