import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/WeatherModel.dart';

abstract class HomeRepository {
  Future<Either<Failures, WeatherModel>> getWeather(String cityName);

}
