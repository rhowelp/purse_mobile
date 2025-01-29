import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purse_mobile/features/welcome_view/presentation/welcome_view.dart';
import 'package:purse_mobile/features/login/presentation/login_view.dart';
import 'package:purse_mobile/features/signup/presentation/signup_view.dart';
import 'package:purse_mobile/features/splash_view/presentation/splash_view.dart';

class MainRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: SplashView.route,
      debugLogDiagnostics: kDebugMode,
      routes: [
        GoRoute(
          path: SplashView.route,
          name: SplashView.routeName,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SplashView(),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeIn)),
                  ),
                  child: child);
            },
          ),
        ),
        GoRoute(
          path: WelcomeView.route,
          name: WelcomeView.routeName,
          builder: (context, state) => const WelcomeView(),
          routes: [
            GoRoute(
              path: LoginView.route,
              name: LoginView.routeName,
              builder: (context, state) => const LoginView(),
            ),
            GoRoute(
              path: SignupView.route,
              name: SignupView.routeName,
              builder: (context, state) => const SignupView(),
            ),
          ],
        ),
      ],
    );
  }
}
