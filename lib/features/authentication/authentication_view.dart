import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/custom_button.dart';

class AuthenticationView extends StatefulWidget {
  static const route = '/AuthenticationView';
  static const routeName = 'AuthenticationView';
  const AuthenticationView({super.key});

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/auth_background.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Gap(size.height * 0.2),
                Image.asset('assets/images/purse_logo.png'),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () {},
                      buttonColor: Colors.white,
                      titleColor: ColorPalette.primary,
                      buttonText: 'Login',
                    ),
                    const Gap(20),
                    CustomButton(
                      onTap: () {},
                      buttonText: 'New to Purse? Sign Up!',
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
