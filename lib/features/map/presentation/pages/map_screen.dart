import 'package:booking_app/core/services/location_services.dart';
import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/font_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:booking_app/features/map/presentation/cubit/map_cubit.dart';
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
  late GoogleMapController _googleMapController;

  @override
  void initState() {
    MapCubit mapCubit = MapCubit.get(context);
    mapCubit.getYourLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MapCubit mapCubit = MapCubit.get(context);
    return Scaffold(
      body: SafeArea(child: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is GetYourLocationState) {
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
                    },
                    markers: {
                      mapCubit.yourPlace!,
                      ...List.generate(mapCubit.hotels.length, (index) {
                        return Marker(
                            markerId:
                                MarkerId(mapCubit.hotels[index].id.toString()),
                            infoWindow: InfoWindow(
                              title: mapCubit.hotels[index].name,
                              onTap: () {
                                MitX.showSnackbar(
                                  MitXSnackBar(
                                    duration: const Duration(seconds: 2),
                                    title: mapCubit.hotels[index].name,
                                    message: "Click here to search wait 1 sec",
                                    onTap: (_) async {
                                      MitX.back();
                                      Future.delayed(
                                          const Duration(milliseconds: 1000),
                                          () {
                                        MitX.back();
                                      });
                                      ExploreCubit exploreCubit =
                                          ExploreCubit.get(context);
                                      exploreCubit.long =
                                          mapCubit.hotels[index].long;
                                      exploreCubit.lat =
                                          mapCubit.hotels[index].lat;

                                      exploreCubit.searchHotel();
                                    },
                                  ),
                                );
                              },
                            ),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueOrange),
                            position: LatLng(mapCubit.hotels[index].lat,
                                mapCubit.hotels[index].long));
                      })
                    },
                    onTap: (LatLng latLng) async {
                      MitX.showSnackbar(
                        MitXSnackBar(
                          duration: const Duration(seconds: 2),
                          title: "Search With this position",
                          message: "Click here to search wait 1 sec",
                          onTap: (_) {
                            MitX.back();
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              MitX.back();
                            });
                            ExploreCubit exploreCubit =
                                ExploreCubit.get(context);
                            exploreCubit.long = latLng.longitude;
                            exploreCubit.lat = latLng.latitude;

                            exploreCubit.searchHotel();
                          },
                        ),
                      );
                    },
                    initialCameraPosition: CameraPosition(
                        zoom: 12,
                        target: LatLng(mapCubit.yourLocation!.latitude,
                            mapCubit.yourLocation!.longitude)),
                  ),
                ),
                BuildHotels(mapCubit: mapCubit)
              ],
            ),
          );
        },
      )),
    );
  }
}

class BuildHotels extends StatelessWidget {
  const BuildHotels({
    Key? key,
    required this.mapCubit,
  }) : super(key: key);

  final MapCubit mapCubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: context.width,
        height: context.height * .16,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: mapCubit.hotels.length,
          itemBuilder: (context, index) {
            HotelMap data = mapCubit.hotels[index];
            return SizedBox(
              height: context.height * .15,
              width: context.width * .8,
              child: Row(
                children: [
                  // image section
                  Container(
                    width: context.width * .3,
                    height: context.height * .15,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s20),
                        bottomLeft: Radius.circular(AppSize.s20),
                      ),
                      color: ColorManager.grey,
                      image: DecorationImage(
                          image: AssetImage(data.image), fit: BoxFit.cover),
                    ),
                  ),
                  // text Container
                  Expanded(
                    child: Container(
                      height: AppSize.s150,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(AppSize.s20),
                          bottomRight: Radius.circular(AppSize.s20),
                        ),
                        color: ColorManager.grey.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          AppPadding.p16,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            Text(
                              data.address,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: ColorManager.grey,
                                  ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: ColorManager.primary,
                                          size: AppSize.s16,
                                        ),
                                        Text(
                                          data.distance,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                color: ColorManager.grey,
                                              ),
                                        ),
                                      ],
                                    ),
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      initialRating: data.rate * 5 / 10,
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: FontSize.s20.sp,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      ' \$100',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                    Text(
                                      '/per night',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            color: ColorManager.grey,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
        ),
      ),
    );
  }
}
