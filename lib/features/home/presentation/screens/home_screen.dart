import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../../core/utils/sliver_app_bar.dart';
import '../../../../core/utils/sliver_list_widget.dart';
import '../../../location/presentation/widgets/location_error.dart';
import '../../cubit/home_cubit.dart';
import '../widgets/current_weather/country_widget.dart';
import '../widgets/current_weather/divider_widget.dart';
import '../widgets/current_weather/header_widget.dart';
import '../widgets/current_weather/footer_widget.dart';
import '../widgets/current_weather/weather_degree.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sl<HomeCubit>().getWeather();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeState>(
          buildWhen: (previous, current) => current is WeatherLoadedState,
          listener: (context, state) {
            if (state is WeatherLoadedState) {
              ZoomDrawer.of(context)!.close();
            }
            if (state is WeatherErrorState) {
              ZoomDrawer.of(context)!.close();
            }
          },
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return const LoadingWidget();
            } else if (state is WeatherLoadedState) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBarWidget(
                    expandedHeight: MediaQuery.of(context).size.height - 150.h,
                    containerHeight: MediaQuery.of(context).size.height - 150.h,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HeaderWidget(
                          model: state.sevenWeatherModel,
                          title: state.sevenWeatherModel.location!.name!,
                          icon: Icons.location_on_outlined,
                          fun: () => ZoomDrawer.of(context)!.open(),
                        ),
                        CountryWidget(
                            weather: state.sevenWeatherModel),
                        WeatherDegree(weather: state.sevenWeatherModel),
                        const MyDivider(),
                        FooterWidget(weather: state.sevenWeatherModel),
                      ],
                    ),
                    weatherModel: state.sevenWeatherModel,
                  ),
                  SliverListWidget(weatherModel: state.sevenWeatherModel)
                ],
              );
            } else {
              return const ErrorLocation();
            }
          },
        ),
      ),
    );
  }
}
