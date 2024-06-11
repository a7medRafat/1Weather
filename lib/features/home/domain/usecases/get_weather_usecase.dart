import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/WeatherModel.dart';
import '../repositories/home_repository.dart';

class GetWeatherUseCase {
  final HomeRepository weatherRepository;

  GetWeatherUseCase({required this.weatherRepository});

  Future<Either<Failures, WeatherModel>> call(String cityName) async {
    return await weatherRepository.getWeather(cityName);
  }
}
