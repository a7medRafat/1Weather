import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:oneweather/core/shared_preferances/cache_helper.dart';
import '../../../core/constants.dart';
part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<bool> handleLocationPermission(context) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      emit(LocationPermissionDeniedState());
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        emit(LocationPermissionDeniedState());

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          padding: EdgeInsets.all(8),
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      emit(LocationPermissionDeniedState());

      return false;
    }

    return true;
  }

  Future<void> getCurrentPosition(context) async {
    emit(GetCurrentPositionLoadingState());
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      await getAddressFromLatLng(position);
      emit(GetCurrentPositionSuccessState());
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      myLocation = '${place.subAdministrativeArea}';
      CacheHelper.saveData(key: 'isLocated', value: myLocation);
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
