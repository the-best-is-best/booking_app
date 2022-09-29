part of 'map_cubit.dart';

abstract class MapState {
  const MapState();
}

class MapInitial extends MapState {}

class GetYourLocationState extends MapState {}

class OpenMapState extends MapState {}

class MapLoadState extends MapState {}

class MapLoadedState extends MapState {}

class MapSearchState extends MapState {}

class MapErrorState extends MapState {
  final String? title;

  MapErrorState(this.title);
}
