import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/explore/data/repository_explore.dart';
import 'package:booking_app/features/explore/data/repository_facilities.dart';
import 'package:booking_app/features/explore/data/repository_search.dart';
import 'package:booking_app/features/explore/domain/facilities_models.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._repositoryExplore, this._repositoryFacilities,
      this._repositorySearch)
      : super(ExploreInitial());
  HotelModel? hotelModel;
  final RepositoryExplore _repositoryExplore;
  final RepositoryFacilities _repositoryFacilities;
  final RepositorySearch _repositorySearch;
  static ExploreCubit get(BuildContext context) => BlocProvider.of(context);

  SfRangeValues sfRangePrice = const SfRangeValues(0, 200);
  double sfRangeDistance = 5;
  String nameTextController = "";
  String addressTextController = "";
  double? long;
  double? lat;

  void changeSfRangePrice(SfRangeValues? sfRangeValues) {
    sfRangePrice = sfRangeValues ?? const SfRangeValues(0, 200);
    emit(ChangePriceMainAndMaxState());
  }

  void changeSfSliderDistance(double? sfRangeValues) {
    sfRangeDistance = sfRangeValues ?? 0;
    emit(ChangeDistanceState());
  }

  List<FacilitiesModels>? facilitiesModel;
  Map<int, bool> facilitiesActive = {};

  void checkFacilities(int index) {
    facilitiesActive[index] = !facilitiesActive[index]!;
    emit(FacilitiesActiveState());
  }

  Future<void> getFacilities() async {
    Either<Failure, List<FacilitiesModels>> response =
        await _repositoryFacilities.getFacilities();
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        facilitiesModel = r;
        int index = 0;
        for (var _ in r) {
          facilitiesActive.addAll({index: false});
          index++;
        }
        debugPrint(r.toString());
      },
    );
  }

  bool inEndScroll = false;
  Future<void> getHotels({int page = 1, bool force = false}) async {
    if (force) {
      hotelModel = null;
    }
    if (hotelModel != null) {
      emit(ExploreSearchState());
    } else {
      emit(ExploreLoadState());
    }
    Either<Failure, HotelModel> response =
        await _repositoryExplore.getHotel(ExploreRequests(page: page));
    response.fold(
      (l) {
        debugPrint(l.messages);
        emit(ExploreErrorState(l.messages));
      },
      (r) {
        if (hotelModel != null) {
          hotelModel!.nextPageUrl = r.nextPageUrl;
          for (var element in r.data) {
            hotelModel!.data.add(element);
          }
        } else {
          print("null null null");
          hotelModel = r;
        }
        debugPrint(r.toString());
        inEndScroll = false;

        emit(ExploreLoadedState());
      },
    );
  }

  Future<void> searchHotelByName({int page = 1, required String name}) async {
    emit(ExploreLoadState());
    nameTextController = name;
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

  Future<void> searchHotel({int page = 1, String? address}) async {
    emit(ExploreLoadState());
    addressTextController = address ?? addressTextController;
    Map<String, int> selectedFacilities = {};
    facilitiesActive.forEach((key, value) {
      if (value) {
        selectedFacilities.addAll({key.toString(): facilitiesModel![key].id});
      }
    });
    Either<Failure, HotelModel> response =
        await _repositorySearch.searchHotel(SearchRequests(
      page: page,
      name: nameTextController,
      facilities: selectedFacilities,
      latitude: lat,
      longitude: long,
      distance: sfRangeDistance,
      address: addressTextController,
    ));
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

  void clearFilter() {
    nameTextController = "";
    addressTextController = "";
    lat = null;
    long = null;
    sfRangeDistance = 5;
    sfRangePrice = const SfRangeValues(0, 200);
    facilitiesActive = {};
    searchHotel();
  }
}
