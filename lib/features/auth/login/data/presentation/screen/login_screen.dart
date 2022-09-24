import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/input_field_label.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:booking_app/features/explore/presentation/cubit/explore_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mit_x/mit_x.dart';

import '../../../../../../core/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    AuthCubit authCubit = AuthCubit.get(context);
    ExploreCubit exploreCubit = ExploreCubit.get(context);
    exploreCubit.getFacilities();
    authCubit.getProfileInfo().then((value) {
      if (authCubit.userModel.apiToken.isNotEmpty) {
        MitX.offAllNamed(Routes.homeRoute);
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    AuthCubit authCubit = AuthCubit.get(context);
    authCubit.resetShowPassword();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var loginFromKey = GlobalKey<FormState>();
    AuthCubit authCubit = AuthCubit.get(context);

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              MitX.offAllNamed(Routes.homeRoute);
            });
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) =>
              current is AuthErrorState || current is AuthInitial,
          builder: (context, state) {
            if (state is AuthGetLocalProfileState) {
              return const MyCircularIndicator();
            }
            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButton(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    Form(
                      key: loginFromKey,
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: SingleChildScrollView(
                          child: Column(children: [
                            const SizedBox(height: AppSize.s20),
                            SvgPicture.asset(
                              ImageAssets.welcome,
                              height: AppSize.s100 * 1.5,
                              width: double.infinity,
                            ),
                            const SizedBox(height: AppSize.s40),
                            InputField(
                              textController: emailController,
                              label: "Your email",
                              hint: "Enter your email",
                              prefix: Icons.person,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' Email Address must be filled';
                                }
                                if (!MitXUtils.isEmail(value)) {
                                  return "email is not valid";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: AppSize.s14),
                            BlocBuilder<AuthCubit, AuthState>(
                              buildWhen: (previous, current) =>
                                  current is AuthChangeShowPasswordState,
                              builder: (context, state) => InputField(
                                textController: passwordController,
                                label: "Password",
                                hint: "Enter password",
                                isPassword:
                                    authCubit.isShowPassword ? false : true,
                                prefix: Icons.lock,
                                suffix: authCubit.isShowPassword
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye,
                                suffixPressed: () {
                                  authCubit.showPassword();
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password must be filled';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: AppSize.s20),
                            Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: GestureDetector(
                                    onTap: () {
                                      MitX.toNamed(Routes.forgotPasswordRoute);
                                    },
                                    child: const InputFieldLabel(
                                        'Forget your Password ?'))),
                            const SizedBox(height: AppSize.s20),
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthErrorState) {
                                  MitX.showSnackbar(MitXSnackBar(
                                    duration: const Duration(seconds: 2),
                                    title: "Alert",
                                    message: state.message ?? "",
                                  ));
                                }
                              },
                              builder: (context, state) {
                                if (state is! AuthLoadingState) {
                                  return MainButton(
                                    onTap: () {
                                      if (loginFromKey.currentState!
                                          .validate()) {
                                        authCubit.login(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    title: 'Login',
                                  );
                                } else {
                                  return const MyCircularIndicator();
                                }
                              },
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
