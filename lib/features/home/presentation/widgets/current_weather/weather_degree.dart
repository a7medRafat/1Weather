import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/WeatherModel.dart';
import 'country_widget.dart';
import 'image_widget.dart';

class WeatherDegree extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDegree({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ImageWidget(
            weatherModel: weather,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                      "${weather.forecast!.forecastday![0].day!.maxtempC!.round()}",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    weather.forecast!.forecastday![0].day!.condition!.text
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20.sp),
                  ),
                  Text(
                    weather.forecast!.forecastday![0].date.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
