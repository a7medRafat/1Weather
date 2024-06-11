import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/WeatherModel.dart';

abstract class HomeLocalDataSource {
  Future<Unit> cachesWeather(WeatherModel weatherModel);

  Future<WeatherModel> getCachedWeather();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  final SharedPreferences sharedPreferences;

  HomeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachesWeather(WeatherModel weatherModel) {
    final weatherModelToJson = weatherModel.toJson();
    sharedPreferences.setString(
        'CACHED_WEATHER', json.encode(weatherModelToJson));
    return Future.value(unit);
  }

  @override
  Future<WeatherModel> getCachedWeather() {
    final jsonString = sharedPreferences.getString('CACHED_WEATHER');
    if (jsonString != null) {
      final decodeJson = json.decode(jsonString);
      final jsonToWeatherModel = WeatherModel.fromJson(decodeJson);
      return Future.value(jsonToWeatherModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
