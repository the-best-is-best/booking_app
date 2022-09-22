import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/home/presentation/tabs/features/trips/data/repository_trips.dart';
import 'package:booking_app/features/home/presentation/tabs/features/trips/domain/trips_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  final RepositoryTrips _repositoryTrips;
  TripsCubit(this._repositoryTrips) : super(TripsInitial());

  static TripsCubit get(context) => BlocProvider.of(context);
  TripsModel? tripsCompleted;
  TripsModel? tripsModel;
  int currentTap = 1;

  void changeCurrentPage({required int page, required String tokenUser}) {
    currentTap = page;
    getTrips(tokenUser: tokenUser);
  }

  Future<void> getTrips({int page = 1, required String tokenUser}) async {
    TypeTrip? typeTrip;
    switch (currentTap) {
      case 1:
        typeTrip = TypeTrip.upcomming;
        break;
      case 2:
        typeTrip = TypeTrip.completed;
        break;
      case 3:
        typeTrip = TypeTrip.cancelled;

        break;

      default:
    }
    emit(TripsLoadingState());
    Either<Failure, TripsModel> response = await _repositoryTrips.getTrips(
        TripRequest(page: page, type: typeTrip!.name, token: tokenUser));
    response.fold(
      (l) {
        emit(TripsErrorState(l.messages));
        debugPrint(l.messages);
        tripsModel = null;
        emit(TripsLoadedState());
      },
      (r) {
        if (typeTrip == TypeTrip.cancelled) {
          tripsCompleted = r;
        }
        tripsModel = r;

        emit(TripsLoadedState());
      },
    );
  }
}

enum TypeTrip { upcomming, cancelled, completed }

extension on TypeTrip {
  String get name => this.toString().split('.').last;
}
