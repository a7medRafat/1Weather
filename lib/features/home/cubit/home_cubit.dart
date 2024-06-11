import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:meta/meta.dart';
import '../../../core/constants.dart';
import '../../../core/errors/failures.dart';
import '../../../core/failures_message/failures_messages.dart';
import '../data/models/WeatherModel.dart';
import '../domain/usecases/get_weather_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.weatherUseCase}) : super(HomeInitial());

  final GetWeatherUseCase weatherUseCase;
  final drawerController = ZoomDrawerController();

  final city = TextEditingController();

  static HomeCubit get(context) => BlocProvider.of(context);

  void getWeather() async {
    emit(WeatherLoadingState());
    Either<Failures, WeatherModel> response =
        await weatherUseCase.call(city.text.isEmpty ? myLocation : city.text);
    response.fold(
        (failure) =>
            emit(WeatherErrorState(message: FailureMessage.failure(failure))),
        (weather) {
      city.clear();
      emit(WeatherLoadedState(sevenWeatherModel: weather));
    });
  }
}
