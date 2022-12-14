part of 'explore_cubit.dart';

abstract class ExploreState {
  const ExploreState();
}

class ExploreInitial extends ExploreState {}

class ExploreLoadState extends ExploreState {}

class ExploreLoadedState extends ExploreState {}

class ExploreSearchState extends ExploreState {}

class ExploreErrorState extends ExploreState {
  final String? title;

  ExploreErrorState(this.title);
}

class ChangePriceMainAndMaxState extends ExploreState {}

class ChangeDistanceState extends ExploreState {}

class FacilitiesActiveState extends ExploreState {}
