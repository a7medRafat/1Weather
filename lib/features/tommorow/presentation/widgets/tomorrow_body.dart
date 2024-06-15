import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oneweather/features/tommorow/presentation/widgets/tommorow_img.dart';
import '../../../../core/utils/condition_img.dart';
import '../../../home/data/models/WeatherModel.dart';

class TomorrowBody extends StatelessWidget {
  final WeatherModel weatherModel;

  const TomorrowBody({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TomorrowImg(weatherModel: weatherModel),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tomorrow'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text(
                      weatherModel.forecast!.forecastday![1].day!.maxtempC!
                          .toInt()
                          .toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 80.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          '/',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 35, color: Colors.white54),
                        ),
                        Text(
                          '${weatherModel.forecast!.forecastday![1].day!.mintempC!.toInt().toString()}\u00B0',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 30, color: Colors.white54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                weatherModel.forecast!.forecastday![1].day!.condition!.text!,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        )
      ],
    );
  }
}
