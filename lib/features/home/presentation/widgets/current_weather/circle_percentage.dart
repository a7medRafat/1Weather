import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../config/app_colors.dart';
import '../../../data/models/WeatherModel.dart';

class CirclePercentage extends StatelessWidget {

  final WeatherModel model;
   const CirclePercentage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CircularPercentIndicator(
        radius: 40,
        animation: true,
        animationDuration: 1200,
        lineWidth: 10,
        percent: model.forecast!.forecastday![0].astro!.moonIllumination!.toDouble()/100,
        center: Image.asset('assets/images/moon.png',height: 30.h),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: Colors.white10,
        progressColor: AppColors.appColor,
      ),
    );
  }
}
