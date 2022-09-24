import 'package:booking_app/core/services/location_services.dart';
import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());
  static MapCubit get(BuildContext context) => BlocProvider.of(context);

  Position? yourLocation;
  Marker? yourPlace;
  List<HotelMap> hotels = [
    HotelMap(
        id: 1,
        name: "Grand Royal",
        image: ImageAssets.hotel_1,
        rate: 9.5,
        address: "Wembley, London",
        distance: "2.0km to city",
        lat: 0,
        long: 0),
    HotelMap(
        id: 2,
        name: "Queen Royal",
        image: ImageAssets.hotel_2,
        rate: 7.5,
        address: "Wembley, London",
        lat: 0,
        long: 0,
        distance: "4.0km to city"),
    HotelMap(
        id: 3,
        name: "Grand Royal 1",
        image: ImageAssets.hotel_3,
        rate: 5.5,
        address: "Wembley, London",
        lat: 0,
        long: 0,
        distance: "6.0km to city"),
    HotelMap(
        id: 4,
        name: "Queen Royal 1",
        image: ImageAssets.hotel_3,
        rate: 10,
        address: "Wembley, London",
        lat: 0,
        long: 0,
        distance: "8.0km to city"),
  ];

  Future getYourLocation() async {
    emit(GetYourLocationState());
    yourLocation = await getGeoLocationPosition();
    if (yourLocation == null) {
      getYourLocation();
    }
    yourPlace = Marker(
        markerId: const MarkerId("yourPlace"),
        position: LatLng(yourLocation!.latitude, yourLocation!.longitude));
    hotels[0].lat = yourLocation!.latitude + 0.015;
    hotels[0].long = yourLocation!.longitude + 0.015;
    hotels[1].lat = yourLocation!.latitude + 0.03;
    hotels[1].long = yourLocation!.longitude - 0.05;
    hotels[2].lat = yourLocation!.latitude - 0.03;
    hotels[2].long = yourLocation!.longitude - 0.03;
    hotels[3].lat = yourLocation!.latitude - 0.06;
    hotels[3].long = yourLocation!.longitude - 0.03;

    emit(OpenMapState());
  }
}

class HotelMap {
  final int id;
  final String name;
  final String image;
  final double rate;
  final String address;
  final String distance;
  double lat;
  double long;

  HotelMap({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.address,
    required this.distance,
    required this.lat,
    required this.long,
  });
}
