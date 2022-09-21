import 'package:booking_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: ColorManager.error,
          child: const Text('Home page'),
        ),
      ),
    );
  }
}
