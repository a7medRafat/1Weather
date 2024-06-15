import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oneweather/features/home/cubit/home_cubit.dart';
import 'package:oneweather/features/location/presentation/widgets/background.dart';
import 'package:oneweather/features/location/presentation/widgets/current_location.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/utils/go.dart';
import '../../../home/presentation/screens/drawer_Screen.dart';
import '../../cubit/location_cubit.dart';
import '../widgets/or_widget.dart';
import '../widgets/search.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Background(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocConsumer<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is GetCurrentPositionSuccessState) {
                sl<HomeCubit>().getWeather();
                navigateAndFinish(context, const Zoom());
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SearchCity(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            sl<HomeCubit>().getWeather();
                            navigateAndFinish(context, const Zoom());
                          }
                        },
                      ),
                      const OrWidget(),
                      const CurrentLocation(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
