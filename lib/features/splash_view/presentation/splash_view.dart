import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/features/authentication/presentation/authentication_view.dart';

class SplashView extends StatefulWidget {
  static const route = '/SplashView';
  static const routeName = 'SplashView';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> redirect() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        // ignore: use_build_context_synchronously
        context.pushNamed(AuthenticationView.routeName);
      },
    );
  }

  @override
  void initState() {
    redirect();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Center(
        child: FadeInUp(
          duration: const Duration(seconds: 3),
          child: Image.asset('assets/images/purse_logo.png'),
        ),
      ),
    );
  }
}
