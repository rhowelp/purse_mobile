import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class SplashView extends StatelessWidget {
  static const route = '/SplashView';
  static const routeName = 'SplashView';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: FadeInUp(
        child: Image.asset('assets/images/purse_logo.png'),
      ),
    );
  }
}
