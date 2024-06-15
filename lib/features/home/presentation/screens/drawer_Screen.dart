import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../../app/injuctoin_container.dart';
import '../../cubit/home_cubit.dart';
import 'home_screen.dart';
import 'menue_screen.dart';

class Zoom extends StatelessWidget {
  const Zoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: sl<HomeCubit>().drawerController,
        style: DrawerStyle.defaultStyle,
        borderRadius: 24.0,
        slideWidth: MediaQuery.of(context).size.width * (0.6),
        openCurve: Curves.fastLinearToSlowEaseIn,
        closeCurve: Curves.bounceIn,
        angle: 0.0,
        showShadow: true,
        menuScreen: const MenuDrawer(),
        mainScreen: const HomeScreen(),
      ),
    );
  }
}
