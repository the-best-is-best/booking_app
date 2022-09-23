import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/explore/data/repository_explore.dart';
import 'package:booking_app/features/explore/data/repository_facilities.dart';
import 'package:booking_app/features/explore/data/repository_search.dart';
import 'package:booking_app/features/explore/domain/facilities_models.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mit_x/mit_x.dart';
part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._repositoryExplore, this._repositoryFacilities,
      this._repositorySearch)
      : super(ExploreInitial());
  HotelModel? hotelModel;
  List<FacilitiesModels>? facilitiesModel;
  final RepositoryExplore _repositoryExplore;
  final RepositoryFacilities _repositoryFacilities;
  final RepositorySearch _repositorySearch;
  static ExploreCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getFacilities() async {
    Either<Failure, List<FacilitiesModels>> response =
        await _repositoryFacilities.getFacilities();
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        facilitiesModel = r;
        debugPrint(r.toString());
      },
    );
  }

  Future<void> getHotels({int page = 1}) async {
    emit(ExploreLoadState());
    Either<Failure, HotelModel> response =
        await _repositoryExplore.getHotel(ExploreRequests(page: page));
    response.fold(
      (l) {
        debugPrint(l.messages);
        emit(ExploreErrorState(l.messages));
      },
      (r) {
        hotelModel = r;
        debugPrint(r.toString());
        emit(ExploreLoadedState());
      },
    );
  }

  Future<void> searchHotelByName({int page = 1, String? name}) async {
    emit(ExploreLoadState());
    Either<Failure, HotelModel> response = await _repositorySearch
        .searchHotel(SearchRequests(page: page, name: name));
    response.fold(
      (l) {
        debugPrint(l.messages);
        emit(ExploreErrorState(l.messages));
      },
      (r) {
        hotelModel = r;
        debugPrint(r.toString());
        emit(ExploreLoadedState());
      },
    );
  }
}
