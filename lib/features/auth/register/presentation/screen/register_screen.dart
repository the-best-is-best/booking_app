import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/input_field.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/core/widgets/my_circular_indicator.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mit_x/mit_x.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void didChangeDependencies() {
    AuthCubit authCubit = AuthCubit.get(context);
    authCubit.resetShowPassword();
    super.didChangeDependencies();
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  var loginFromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            MitX.offAndToNamed(Routes.homeRoute);
          } else if (state is AuthErrorState) {
            MitX.showSnackbar(MitXSnackBar(
              duration: const Duration(seconds: 2),
              title: "Alert",
              message: state.message ?? "",
            ));
          }
        },
        child: SingleChildScrollView(
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
                    'Sign Up',
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
                          height: AppSize.s100,
                          width: double.infinity,
                        ),
                        const SizedBox(height: AppSize.s40),
                        InputField(
                          textController: firstNameController,
                          label: "First name",
                          hint: "Enter First name",
                          prefix: Icons.person,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ' First name must be filled';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSize.s14),
                        InputField(
                          textController: lastNameController,
                          label: "Last name",
                          hint: "Enter Last name",
                          prefix: Icons.person,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ' Last name must be filled';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: AppSize.s14),
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
                          builder: (context, state) {
                            return InputField(
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
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s14),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return InputField(
                              textController: passwordConfirmController,
                              label: "password Confirm",
                              hint: "Enter password Confirm",
                              isPassword:
                                  authCubit.isShowPasswordAgin ? false : true,
                              prefix: Icons.lock,
                              suffix: authCubit.isShowPasswordAgin
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye,
                              suffixPressed: () {
                                authCubit.showPasswordAgin();
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'password Confirm must be filled';
                                } else if (passwordConfirmController.text !=
                                    passwordController.text) {
                                  return ' password don\'t  the same ';
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            if (state is! AuthLoadingState) {
                              return MainButton(
                                onTap: () {
                                  if (loginFromKey.currentState!.validate()) {
                                    authCubit.register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      passwordConfirm:
                                          passwordConfirmController.text,
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                    );
                                  }
                                },
                                title: 'Sign Up',
                              );
                            } else {
                              return const MyCircularIndicator();
                            }
                          },
                        ),
                        const SizedBox(height: AppSize.s20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have account?  ',
                                style: Theme.of(context).textTheme.titleMedium),
                            GestureDetector(
                                onTap: () {
                                  MitX.offNamed(Routes.loginRoute);
                                },
                                child: Text(
                                  'Login',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: ColorManager.primary),
                                )),
                          ],
                        ),
                      ]),
                    ),
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
