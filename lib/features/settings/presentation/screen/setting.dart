import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/features/settings/presentation/widgets/container_edit_profile_widget.dart';
import 'package:booking_app/features/settings/presentation/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p30,
            ),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              const  ContainerEditProfileWidget(),
              const SizedBox(
                height: AppSize.s25,
              ),
              ContainerWidget(
                onTap: () {
                },
                title: 'Change Password',
                icon: Icons.lock,
              ),
              ContainerWidget(
                onTap: () {
                },
                title: 'Invite Friend',
                icon: Icons.people_alt,
              ),
              ContainerWidget(
                onTap: () {
                },
                title: 'Credit &  Coupons',
                icon: Icons.card_giftcard,
              ),
              ContainerWidget(
                onTap: () {
                },
                title: 'Help Center',
                icon: Icons.help_rounded,
              ),
              ContainerWidget(
                onTap: () {
                },
                title: 'Payment',
                icon: Icons.account_balance_wallet,
              ),
              ContainerWidget(
                onTap: () {
                },
                title: 'Log out',
                icon: Icons.logout_outlined,
              ),


            ],
          ),
        ),
      ),
    ),);
  }
}
