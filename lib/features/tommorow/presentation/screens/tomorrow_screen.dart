import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/sliver_app_bar.dart';
import '../../../home/cubit/home_cubit.dart';
import '../../../home/data/models/WeatherModel.dart';
import '../../../home/presentation/widgets/current_weather/Astrospheric_widget.dart';
import '../../../home/presentation/widgets/current_weather/divider_widget.dart';
import '../../../home/presentation/widgets/current_weather/header_widget.dart';
import '../../../home/presentation/widgets/current_weather/side_text_widget.dart';
import '../widgets/tomorrow_body.dart';
import '../widgets/tomorrow_footer.dart';
import '../widgets/tomorrow_listview.dart';

class Tomorrow extends StatelessWidget {
  final WeatherModel weatherModel;

  const Tomorrow({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const LoadingWidget();
        } else if (state is WeatherErrorState) {
        } else if (state is WeatherLoadedState) {
          return CustomScrollView(
            slivers: [
              SliverAppBarWidget(
                expandedHeight: size.height * 0.40,
                containerHeight: size.height * 0.40,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderWidget(
                        model: state.sevenWeatherModel,
                        title: '+3 days',
                        icon: Icons.arrow_back_ios_new_outlined,
                        fun: () => Navigator.pop(context)),
                    const Spacer(),
                    TomorrowBody(weatherModel: state.sevenWeatherModel),
                    const MyDivider(),
                    TomorrowFooter(model: state.sevenWeatherModel)
                  ],
                ),
                weatherModel: weatherModel,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SideTextWidget(text: '+3 days weather'),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => TomorrowListItems(
                              model: state.sevenWeatherModel, i: index),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 3),
                          itemCount: 3),
                      const SideTextWidget(
                        text: 'Astronomy Weather Forecasts',
                      ),
                      AstroWidget(model: state.sevenWeatherModel, i: 2),
                    ],
                  ),
                ),
              ]))
            ],
          );
        }
        return const LoadingWidget();
      },
    ));
  }
}
