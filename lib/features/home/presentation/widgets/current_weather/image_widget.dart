import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../data/models/WeatherModel.dart';

class ImageWidget extends StatelessWidget {
  final WeatherModel weatherModel;

  const ImageWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Image.asset(

      conditionImg(weatherModel, 0),
      fit: BoxFit.cover,
    );
  }
}
