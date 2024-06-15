import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../data/models/WeatherModel.dart';

class ImageWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const ImageWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        height: MediaQuery.of(context).size.height/2.5,
        conditionImg(weatherModel, 0),
        fit: BoxFit.fill,
      ),
    );
  }
}
