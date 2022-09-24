part of 'map_cubit.dart';

abstract class MapState {
  const MapState();
}

class MapInitial extends MapState {}

class GetYourLocationState extends MapState {}

class OpenMapState extends MapState {}
