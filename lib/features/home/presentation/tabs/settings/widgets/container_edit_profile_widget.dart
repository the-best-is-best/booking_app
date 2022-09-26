import 'package:booking_app/app/constants.dart';
import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mit_x/mit_x.dart';

class ContainerEditProfileWidget extends StatelessWidget {
  const ContainerEditProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = AuthCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: GestureDetector(
        onTap: () {
          MitX.toNamed(Routes.editProfile);
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final userModel = authCubit.userModel;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.name,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: AppSize.s20),
                    ),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    Text(
                      'View and Edit Profile',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: AppSize.s16,
                                color: ColorManager.grey,
                              ),
                    ),
                  ],
                ),
                userModel.image != null &&
                        userModel.image!.isNotEmpty &&
                        userModel.image != "${Constants.baseUrl}images"
                    ? CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          userModel.image!,
                        ),
                      )
                    : CircleAvatar(
                        radius: 35,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        backgroundImage: const AssetImage(
                          ImageAssets.appLogo,
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
