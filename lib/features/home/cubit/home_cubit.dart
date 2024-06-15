import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:meta/meta.dart';
import 'package:oneweather/core/shared_preferances/cache_helper.dart';
import '../../../core/errors/failures.dart';
import '../../../core/failures_message/failures_messages.dart';
import '../data/models/WeatherModel.dart';
import '../domain/usecases/get_weather_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.weatherUseCase}) : super(HomeInitial());

  final GetWeatherUseCase weatherUseCase;
  final drawerController = ZoomDrawerController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController cityController = TextEditingController();

  void getWeather() async {
    emit(WeatherLoadingState());
    Either<Failures, WeatherModel> response = await weatherUseCase.call(
        cityController.text.isEmpty
            ? CacheHelper.getData(key: 'isLocated')
            : cityController.text);
    response.fold(
      (failure) =>
          emit(WeatherErrorState(message: FailureMessage.failure(failure))),
      (weather) {
        cityController.clear();
        emit(WeatherLoadedState(sevenWeatherModel: weather));
      },
    );
  }
}
