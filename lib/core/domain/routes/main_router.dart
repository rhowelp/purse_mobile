import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purse_mobile/features/authentication/authentication_view.dart';
import 'package:purse_mobile/features/splash_view/splash_view.dart';

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
          path: AuthenticationView.route,
          name: AuthenticationView.routeName,
          builder: (context, state) => const AuthenticationView(),
        ),
      ],
    );
  }
}
