import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/network/network.dart';
import '../features/home/cubit/home_cubit.dart';
import '../features/home/data/datasources/local/weather_local_data_source.dart';
import '../features/home/data/datasources/remote/weather_remote_data_source.dart';
import '../features/home/data/repositories/home_repository_impl.dart';
import '../features/home/domain/repositories/home_repository.dart';
import '../features/home/domain/usecases/get_weather_usecase.dart';
import '../features/location/cubit/location_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => HomeCubit(weatherUseCase: sl()));

  sl.registerLazySingleton(() => LocationCubit());

  sl.registerLazySingleton(() => GetWeatherUseCase(weatherRepository: sl()));

  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await sl.isReady<SharedPreferences>();

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
