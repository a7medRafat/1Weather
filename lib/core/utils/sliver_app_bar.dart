import 'package:flutter/material.dart';
import '../../config/app_colors.dart';
import '../../features/home/data/models/WeatherModel.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    required this.expandedHeight,
    required this.containerHeight,
    required this.widget,
    required this.weatherModel,
  });

  final Widget widget;
  final double expandedHeight;
  final double containerHeight;
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 2,
        background: Container(
            padding: const EdgeInsets.all(10),
            height: containerHeight,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              gradient:AppColors.back,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: widget),
      ),
    );
  }
}
