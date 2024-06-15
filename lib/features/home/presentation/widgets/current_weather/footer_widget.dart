import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/WeatherModel.dart';

class FooterWidget extends StatelessWidget {
  final WeatherModel weather;

  const FooterWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(CupertinoIcons.wind_snow),
            ),
            Text(
              "${weather.current!.windKph!.round().toString()} %",
              style: TextStyle(fontSize: 13.sp),
            ),
            Text('Wind', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(CupertinoIcons.drop),
            ),
            Text(
              '${weather.current!.humidity!.round().toString()} %',
              style: TextStyle(fontSize: 13.sp),
            ),
            Text('Humidity', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Icon(CupertinoIcons.cloud_bolt_rain),
            ),
            Text(
              '${weather.forecast!.forecastday![0].day!.dailyChanceOfRain!.round().toString()} %',
              style: TextStyle(fontSize: 13.sp),
            ),
            Text('Raining', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}
