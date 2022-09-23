import 'package:booking_app/app/network/failure.dart';
import 'package:booking_app/features/explore/domain/hotels_model.dart';
import 'package:booking_app/features/explore/repository_filter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(this._repositoryFilter) : super(ExploreInitial());
  final RepositoryFilter _repositoryFilter;

  static FilterCubit get(BuildContext context) => BlocProvider.of(context);

  Future<HotelsModel?> hotels(
      {required String? name, required int count, required int page}) async {
    Either<Failure, HotelsModel> response =
        await _repositoryFilter.hotels(SearchHotelRequests(
      name: name,
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
