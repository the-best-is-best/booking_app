import 'package:booking_app/core/functions.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:booking_app/features/home/presentation/tabs/settings/widgets/container_edit_profile_widget.dart';
import 'package:booking_app/features/home/presentation/tabs/settings/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mit_x/mit_x.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
            vertical: AppPadding.p30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ContainerEditProfileWidget(),
                const SizedBox(
                  height: AppSize.s25,
                ),
                ContainerWidget(
                  onTap: () {
                    mySnackBar("Coming Soon");
                  },
                  title: 'Change Password',
                  icon: Icons.lock,
                ),
                ContainerWidget(
                  onTap: () {
                    mySnackBar("Coming Soon");
                  },
                  title: 'Invite Friend',
                  icon: Icons.people_alt,
                ),
                ContainerWidget(
                  onTap: () {
                    mySnackBar("Coming Soon");
                  },
                  title: 'Credit &  Coupons',
                  icon: Icons.card_giftcard,
                ),
                ContainerWidget(
                  onTap: () {
                    mySnackBar("Coming Soon");
                  },
                  title: 'Help Center',
                  icon: Icons.help_rounded,
                ),
                ContainerWidget(
                  onTap: () {
                    mySnackBar("Coming Soon");
                  },
                  title: 'Payment',
                  icon: Icons.account_balance_wallet,
                ),
                BlocListener<AuthCubit, AuthState>(
                  listenWhen: (previous, current) => current is AuthLogoutState,
                  listener: (context, state) {
                    MitX.offAllNamed(Routes.splashRoute);
                  },
                  child: ContainerWidget(
                    onTap: () {
                      authCubit.logout();
                    },
                    title: 'Log out',
                    icon: Icons.logout_outlined,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
