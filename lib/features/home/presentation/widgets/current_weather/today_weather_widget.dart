import 'package:flutter/material.dart';
import '../../../../../core/utils/go.dart';
import '../../../../tommorow/presentation/screens/tomorrow_screen.dart';
import '../../../data/models/WeatherModel.dart';

class TodayWeather extends StatelessWidget {
  final WeatherModel model;

  const TodayWeather({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Today', style: Theme.of(context).textTheme.bodyMedium),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            navigateAndFinish(context, Tomorrow(weatherModel: model));
          },
          child: Row(
            children: [
              Text(
                '3 days',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.white70,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
