import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/core/widgets/input_field_label.dart';
import 'package:booking_app/core/widgets/main_button.dart';
import 'package:booking_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var loginFromKey = GlobalKey<FormState>();
    AuthCubit authCubit = AuthCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                    return null;
                  },
                ),
                const SizedBox(height: AppSize.s14),
                InputField(
                  textController: passwordController,
                  label: "Password",
                  hint: "Enter password",
                  isPassword: true,
                  prefix: Icons.lock,
                  suffix: Icons.remove_red_eye,
                  suffixPressed: () {},
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Password must be filled';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppSize.s20),
                Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.forgotPasswordRoute);
                        },
                        child:
                            const InputFieldLabel('Forget your Password ?'))),
                const SizedBox(height: AppSize.s20),
                MainButton(
                  onTap: () {
                    if (loginFromKey.currentState!.validate()) {
                      authCubit.login(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                    Navigator.pushNamed(context, Routes.exploreRoute);
                  },
                  title: 'Login',
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
