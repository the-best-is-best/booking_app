import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/explore/domain/hotels_model.dart';
import 'package:booking_app/features/explore/repository_explor.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this._repositoryExplor) : super(ExploreInitial());
  final RepositoryExplor _repositoryExplor;

  static ExploreCubit get(BuildContext context) => BlocProvider.of(context);

  Future<HotelsModel?> hotels({required int count, required int page}) async {
    Either<Failure, HotelsModel> response =
        await _repositoryExplor.hotels(HotelRequests(
      count: count,
      page: page,
    ));

    HotelsModel? res;
    response.fold(
      (l) {
        debugPrint(l.messages);
      },
      (r) {
        res = r;
      },
    );

    return res;
  }
}
