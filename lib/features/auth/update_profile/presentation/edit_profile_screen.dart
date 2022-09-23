import 'dart:io';

import 'package:booking_app/app/constants.dart';
import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:booking_app/features/home/presentation/tabs/settings/widgets/input_field_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mit_x/mit_x.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // TextEditingController phoneController = TextEditingController();
  // TextEditingController dateOfBirthController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  var editFromKey = GlobalKey<FormState>();
  @override
  void initState() {
    final userModel = AuthCubit.get(context).userModel;
    emailController.text = userModel.email;
    usernameController.text = userModel.name;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    AuthCubit authCubit = AuthCubit.get(context);
    authCubit.addImage(null);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          MitX.showSnackbar(MitXSnackBar(
            duration: const Duration(seconds: 2),
            title: "Alert",
            message: state.message ?? "",
          ));
        }
      },
      child: Scaffold(
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
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              authCubit.userImage != null
                                  ? CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 60,
                                      child: Image.file(
                                          File(authCubit.userImage!.path)))
                                  : (authCubit.userModel.image != null ||
                                              authCubit.userModel.image!
                                                  .isNotEmpty) &&
                                          authCubit.userModel.image !=
                                              "${Constants.baseUrl}images"
                                      ? CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 60,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                authCubit.userModel.image!,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                                        ImageAssets.appLogo),
                                          ),
                                        )
                                      : const CircleAvatar(
                                          radius: 60,
                                          backgroundImage: AssetImage(
                                            ImageAssets.appLogo,
                                          ),
                                        ),
                              Positioned(
                                left: 0,
                                child: IconButton(
                                  onPressed: () async {
                                    final XFile? image = await _picker
                                        .pickImage(source: ImageSource.gallery);
                                    if (image != null) {
                                      authCubit.addImage(image);
                                    }
                                  },
                                  icon: const CircleAvatar(
                                    radius: 20.0,
                                    child: Icon(
                                      Icons.burst_mode_rounded,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  if (image != null) {
                                    authCubit.addImage(image);
                                  }
                                },
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
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
                  // InputFieldWidget(
                  //   label: 'Phone',
                  //   textController: phoneController,
                  //   validate: (p0) {
                  //     return null;
                  //   },
                  // ),
                  // InputFieldWidget(
                  //   label: 'Date of Birth',
                  //   textController: dateOfBirthController,
                  //   validate: (p0) {
                  //     return null;
                  //   },
                  // ),
                  // InputFieldWidget(
                  //   label: 'address',
                  //   textController: addressController,
                  //   validate: (p0) {
                  //     return null;
                  //   },
                  // ),
                  MainButton(
                    onTap: () {
                      authCubit.updateProfile(
                          email: emailController.text,
                          userName: usernameController.text);
                    },
                    title: "Update",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
