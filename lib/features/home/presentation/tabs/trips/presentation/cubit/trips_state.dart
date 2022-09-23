part of 'trips_cubit.dart';

abstract class TripsState {
  const TripsState();
}

class TripsInitial extends TripsState {}

class TripsLoadingState extends TripsState {}

class TripsErrorState extends TripsState {
  final String? title;

  TripsErrorState(this.title);
}

class TripsLoadedState extends TripsState {}
