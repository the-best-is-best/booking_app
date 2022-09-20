import 'package:booking_app/core/utils/assets_manager.dart';
import 'package:booking_app/core/utils/color_manager.dart';
import 'package:booking_app/core/utils/routes_manager.dart';
import 'package:booking_app/core/utils/values_manager.dart';
import 'package:booking_app/features/auth/presentations/02_login/widget/input_field.dart';
import 'package:booking_app/features/auth/presentations/02_login/widget/input_field_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/main_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var loginFromKey = GlobalKey<FormState>();
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
                MainButton(
                  onTap: () {
                    if (loginFromKey.currentState!.validate()) {}
                  },
                  title: 'Sign Up',
                ),
                const SizedBox(height: AppSize.s20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have account?  ',
                        style: Theme.of(context).textTheme.titleMedium),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.loginRoute);
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
      ),
    );
  }
}
