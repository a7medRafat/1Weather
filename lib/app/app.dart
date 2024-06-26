import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/app_theme.dart';
import '../core/shared_preferances/cache_helper.dart';
import '../features/home/cubit/home_cubit.dart';
import '../features/location/cubit/location_cubit.dart';
import '../features/location/presentation/screens/location_screen.dart';
import '../features/home/presentation/screens/drawer_Screen.dart';
import 'injuctoin_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic isLocated = CacheHelper.getData(key: 'isLocated');
    final Widget widget;

    if (isLocated != null) {
      widget = const Zoom();
    } else {
      widget = LocationPage();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => sl<HomeCubit>()),
        BlocProvider(create: (BuildContext context) => sl<LocationCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              home: widget);
        },
      ),
    );
  }
}
