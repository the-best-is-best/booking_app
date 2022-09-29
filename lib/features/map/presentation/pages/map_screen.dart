import 'package:booking_app/core/services/location_services.dart';
import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/styles_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/explore/domain/hotel_model.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/map/presentation/cubit/map_cubit.dart';
import 'package:booking_app/features/map/presentation/widgets/build_hotels_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mit_x/mit_x.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final ScrollController scrollController = ScrollController();
  int page = 2;
  @override
  void initState() {
    MapCubit mapCubit = MapCubit.get(context);
    mapCubit.getYourLocation();
    mapCubit.getHotels(force: true);
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !mapCubit.inEndScroll) {
        mapCubit.inEndScroll = true;
        if (mapCubit.hotelModel!.nextPageUrl.isNotEmpty) {
          mapCubit.getHotels(page: page);
          Future.delayed(const Duration(milliseconds: 250), () {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          });
          page++;
        }
      }
    });
    super.initState();
  }

  GoogleMapController? _googleMapController;
  double? long;
  double? lat;
  @override
  Widget build(BuildContext context) {
    MapCubit mapCubit = MapCubit.get(context);

    return Scaffold(
      body: SafeArea(child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (mapCubit.hotelModel == null) {
            return const MyCircularIndicator();
          }
          return SizedBox(
            height: context.height,
            child: Stack(
              children: [
                SizedBox(
                  height: context.height * .8,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      _googleMapController = controller;
                      setState(() {});
                    },
                    markers: {
                      mapCubit.yourPlace!,
                      ...List.generate(mapCubit.hotelModel?.data.length ?? 0,
                          (index) {
                        return Marker(
                            onTap: () {
                              long = double.parse(
                                  mapCubit.hotelModel!.data[index].longitude);
                              lat = double.parse(
                                  mapCubit.hotelModel!.data[index].latitude);
                            },
                            markerId: MarkerId(
                                mapCubit.hotelModel!.data[index].id.toString()),
                            infoWindow: InfoWindow(
                              title: mapCubit.hotelModel!.data[index].name,
                            ),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueOrange),
                            position: LatLng(
                                double.parse(
                                    mapCubit.hotelModel!.data[index].latitude),
                                double.parse(mapCubit
                                    .hotelModel!.data[index].longitude)));
                      })
                    },
                    initialCameraPosition: CameraPosition(
                        zoom: 12,
                        target: LatLng(mapCubit.yourLocation!.latitude,
                            mapCubit.yourLocation!.longitude)),
                  ),
                ),
                BuildHotels(
                  mapCubit: mapCubit,
                  googleMapController: _googleMapController,
                  scrollController: scrollController,
                  state: state,
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      if (lat != null && long != null) {
                        MitX.back();
                        ExploreCubit exploreCubit = ExploreCubit.get(context);
                        exploreCubit.long = long;
                        exploreCubit.lat = lat;
                        exploreCubit.searchHotel();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
