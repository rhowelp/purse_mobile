import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/custom_button.dart';
import 'package:purse_mobile/features/login/presentation/login_view.dart';
import 'package:purse_mobile/features/signup/presentation/signup_view.dart';

class WelcomeView extends StatefulWidget {
  static const route = '/WelcomeView';
  static const routeName = 'WelcomeView';
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
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
                Hero(
                  tag: 'logo',
                  child: Image.asset('assets/images/purse_logo.png'),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () => context.pushNamed(LoginView.routeName),
                      buttonColor: Colors.white,
                      titleColor: ColorPalette.primary,
                      buttonText: 'Login',
                    ),
                    const Gap(20),
                    CustomButton(
                      onTap: () => context.pushNamed(SignupView.routeName),
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
