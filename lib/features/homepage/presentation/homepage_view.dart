import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/floating_navbar.dart';
import 'package:purse_mobile/core/widgets/floating_navbar_item.dart';
import 'package:purse_mobile/features/accounts/presentation/accounts_view.dart';
import 'package:purse_mobile/features/budgets/presentation/budgets_view.dart';
import 'package:purse_mobile/features/dashboard/presentation/dashboard_view.dart';
import 'package:purse_mobile/features/settings/presentation/settings_view.dart';
import 'package:purse_mobile/features/transactions/presentation/transactions_view.dart';

class HomepageView extends StatefulWidget {
  static const route = '/HomepageView';
  static const routeName = 'HomepageView';
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  final pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPalette.homeBackgroundColor,
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.white,
        onTap: (int val) => setState(() {
          pageController.animateToPage(
            val,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          _selectedIndex = val;
        }),
        currentIndex: _selectedIndex,
        borderRadius: 40,
        items: [
          FloatingNavbarItem(icon: IconlyBold.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.menu, title: 'Budgets'),
          FloatingNavbarItem(
            customWidget: Image.asset(
              'assets/icons/center_navbar.png',
            ),
          ),
          FloatingNavbarItem(icon: IconlyBold.wallet, title: 'Accounts'),
          FloatingNavbarItem(icon: IconlyBold.setting, title: 'Settings'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: PageView(
          controller: pageController,
          onPageChanged: (val) {
            setState(() {
              _selectedIndex = val;
            });
          },
          children: const [
            DashboardView(),
            BudgetsView(),
            TransactionsView(),
            AccountsView(),
            SettingsView(),
          ],
        ),
      ),
    );
  }
}
