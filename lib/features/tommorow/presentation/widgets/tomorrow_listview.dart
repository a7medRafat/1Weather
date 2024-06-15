import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../config/app_colors.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../home/data/models/WeatherModel.dart';

class TomorrowListItems extends StatelessWidget {
  final WeatherModel model;
  final int i;
  final now = DateTime.now();

  TomorrowListItems({
    super.key,
    required this.model,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: AppColors.back,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateFormat('EE').format(DateTime((now.day + i))),
              style: Theme.of(context).textTheme.bodySmall!,
              textAlign: TextAlign.start,
            ),
            SizedBox(width: 10.w),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    conditionImg(model, i),
                    height: 50.h,
                    alignment: AlignmentDirectional.topStart,
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      model.forecast!.forecastday![i].day!.condition!.text!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white38,
                          ),
                      textAlign: TextAlign.start,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                    '+${model.forecast!.forecastday![i].day!.maxtempC!.toInt()}\u00B0'),
                Text(
                  ' ${model.forecast!.forecastday![i].day!.mintempC!.toInt()}\u00B0',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white38),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
