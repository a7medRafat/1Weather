import 'package:flutter/material.dart';

class WeatherTitle extends StatelessWidget {
  const WeatherTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'take care of your day by checking \n the weather forecast',
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Colors.white70, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }
}
