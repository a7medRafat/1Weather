part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class WeatherLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends HomeState {
  final WeatherModel sevenWeatherModel;

  WeatherLoadedState({required this.sevenWeatherModel});

  @override
  List<Object?> get props => [sevenWeatherModel];
}

class WeatherErrorState extends HomeState {
  final String message;

  WeatherErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
