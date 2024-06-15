import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oneweather/config/app_colors.dart';

class AppButton extends StatelessWidget {
  final Widget widget;
  final Color color;

  const AppButton({super.key, required this.widget, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: widget);
  }
}
