import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/features/settings/presentation/widgets/input_field_widget.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    var editFromKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p14),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: Text(
                    'Edit Profile',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: AppSize.s25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                            ImageAssets.appLogo,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const CircleAvatar(
                            radius: 20.0,
                            child: Icon(
                              Icons.camera_alt,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s25,
                ),
                InputFieldWidget(
                  label: 'User Name',
                  textController: usernameController,
                  validate: (p0) {
                    return null;
                  },
                ),
                InputFieldWidget(
                  label: 'Email',
                  textController: emailController,
                  validate: (p0) {
                    return null;
                  },
                ),
                InputFieldWidget(
                  label: 'Phone',
                  textController: phoneController,
                  validate: (p0) {
                    return null;
                  },
                ),
                InputFieldWidget(
                  label: 'Date of Birth',
                  textController: dateOfBirthController,
                  validate: (p0) {
                    return null;
                  },
                ),
                InputFieldWidget(
                  label: 'address',
                  textController: addressController,
                  validate: (p0) {
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
