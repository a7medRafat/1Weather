import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneweather/features/location/presentation/widgets/background.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/constants.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../../../../core/utils/button.dart';
import '../../../../core/utils/go.dart';
import '../../../../core/utils/loading_widget.dart';
import '../../../home/cubit/home_cubit.dart';
import '../../../home/presentation/screens/drawer_Screen.dart';
import '../../cubit/location_cubit.dart';
import '../widgets/image.dart';
import '../widgets/title.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Img(img: 'assets/images/board.png'),
                Column(
                  children: [
                    const WeatherTitle(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(width: 5),
                          Text(
                            myLocation,
                            style: Theme.of(context).textTheme.bodyMedium!,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      if (state is GetCurrentPositionLoadingState) {
                        return const LoadingWidget();
                      }
                      return AppButton(
                        widget: myLocation.isEmpty
                            ? TextButton(
                                onPressed: () {
                                  sl<LocationCubit>()
                                      .getCurrentPosition(context);
                                },
                                child: Text(
                                  sl<LocationCubit>().buttonState,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.blue),
                                ))
                            : TextButton(
                                onPressed: () {
                                  sl<HomeCubit>().getWeather();
                                  navigateAndFinish(context, const Zoom());
                                  CacheHelper.saveData(
                                      key: 'isLocated',
                                      value: myLocation.toString());
                                },
                                child: Text(sl<LocationCubit>().buttonState,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.blue))),
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
