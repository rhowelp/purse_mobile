import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:purse_mobile/features/authentication/presentation/authentication_view.dart';
import 'package:purse_mobile/features/authentication/presentation/screens/forgot_password_view.dart';
import 'package:purse_mobile/features/authentication/presentation/screens/login_view.dart';
import 'package:purse_mobile/features/authentication/presentation/screens/signup_view.dart';
import 'package:purse_mobile/features/budgets/presentation/add_budgets.dart';
import 'package:purse_mobile/features/budgets/presentation/add_budget_item.dart';
import 'package:purse_mobile/features/budgets/presentation/sub_screens/categories.dart';
import 'package:purse_mobile/features/homepage/presentation/homepage_view.dart';
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
          path: AuthenticationView.route,
          name: AuthenticationView.routeName,
          builder: (context, state) => const AuthenticationView(),
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
            GoRoute(
              path: ForgotPasswordView.route,
              name: ForgotPasswordView.routeName,
              builder: (context, state) => const ForgotPasswordView(),
            ),
          ],
        ),
        GoRoute(
          path: HomepageView.route,
          name: HomepageView.routeName,
          builder: (context, state) => const HomepageView(),
        ),
        GoRoute(
          path: AddBudgets.route,
          name: AddBudgets.routeName,
          builder: (context, state) => const AddBudgets(),
          routes: [
            GoRoute(
              path: AddBudgetItem.route,
              name: AddBudgetItem.routeName,
              builder: (context, state) => const AddBudgetItem(),
            ),
            GoRoute(
              path: BudgetCategories.route,
              name: BudgetCategories.routeName,
              builder: (context, state) => const BudgetCategories(),
            ),
          ],
        ),
      ],
    );
  }
}
