import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/explore/data/repository_explore.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._repositoryExplore) : super(ExploreInitial());
  HotelModel? hotelModel;
  final RepositoryExplore _repositoryExplore;

  static ExploreCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getHotels() async {
    Either<Failure, HotelModel> response =
        await _repositoryExplore.getHotel(ExploreRequests(page: 1));
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        hotelModel = r;
        debugPrint(r.toString());
      },
    );
  }
}
