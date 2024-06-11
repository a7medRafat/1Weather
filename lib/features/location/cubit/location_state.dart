part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationPermissionDeniedState extends LocationState {
  @override
  List<Object?> get props => [];
}

class GetCurrentAddressSuccessState extends LocationState {
  @override
  List<Object?> get props => [];
}

class GetCurrentPositionLoadingState extends LocationState {
  @override
  List<Object?> get props => [];
}

class GetCurrentPositionSuccessState extends LocationState {
  @override
  List<Object?> get props => [];
}

class ButtonChangSStateState extends LocationState {
  @override
  List<Object?> get props => [];
}
