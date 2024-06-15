import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../app/injuctoin_container.dart';
import '../../cubit/home_cubit.dart';
import '../widgets/current_weather/choose_city_widget.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is WeatherLoadedState) {
          ZoomDrawer.of(context)!.close();
        }
        if (state is WeatherErrorState) {
          ZoomDrawer.of(context)!.close();
        }
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return ChooseCityWidget(
                        controller: sl<HomeCubit>().cityController,
                        hint: 'Choose City',
                        fun: () {
                          if (formKey.currentState!.validate()) {
                            sl<HomeCubit>().getWeather();
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
