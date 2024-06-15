import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/leading_btn.dart';
import '../../../data/models/WeatherModel.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      required this.model,
      required this.title,
      required this.fun,
      required this.icon});

  final WeatherModel model;
  final String title;
  final IconData icon;
  final fun;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LeadingIcon(icon: icon, fun: fun),
        Expanded(
          child: SizedBox(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.map, color: Colors.white),
                  Flexible(
                    child: Text(
                      textAlign: TextAlign.center,
                     " $title",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(CupertinoIcons.arrow_merge),
        )
      ],
    );
  }
}
