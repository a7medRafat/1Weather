import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/local/weather_local_data_source.dart';
import '../datasources/remote/weather_remote_data_source.dart';
import '../models/WeatherModel.dart';

class HomeRepositoryImpl extends HomeRepository {
  final NetworkInfo networkInfo;
  final WeatherRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failures, WeatherModel>> getWeather(String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await remoteDataSource.getWeather(cityName);
        localDataSource.cachesWeather(remoteWeather);
        return right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeather = await localDataSource.getCachedWeather();
        return right(localWeather);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }
}
