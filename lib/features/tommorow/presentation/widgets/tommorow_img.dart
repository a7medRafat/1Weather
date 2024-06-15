import 'package:flutter/cupertino.dart';

import '../../../../core/utils/condition_img.dart';
import '../../../home/data/models/WeatherModel.dart';

class TomorrowImg extends StatelessWidget {
  const TomorrowImg({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Image.asset(
            fit: BoxFit.cover,
            conditionImg(weatherModel, 1),
            height: MediaQuery.of(context).size.width / 2.5));
  }
}
