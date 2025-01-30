import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class DashboardView extends StatefulWidget {
  static const route = '/DashboardView';
  static const routeName = 'DashboardView';

  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool isBalanceShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.homeBackgroundColor,
      body: Column(
        children: [
          // Stack(
          //   children: [
          //     Image.asset(
          //       'assets/images/home_top_background.png',
          //       fit: BoxFit.cover,
          //     ),
          //   ],
          // ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/home_top_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Gap(kToolbarHeight),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        foregroundImage:
                            AssetImage('assets/images/test_user.png'),
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rhowel Parayno',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            DateFormat('MMM dd, yyyy').format(DateTime.now()),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cash Balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isBalanceShow = !isBalanceShow;
                        });
                      },
                      child: Icon(
                        isBalanceShow ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Text(
                  DateFormat('MMM dd, yyyy').format(DateTime.now()),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
                Text(
                  isBalanceShow ? '₱15,000.00' : '*****',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upcoming Due',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            '₱5,000.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.bolt,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(40),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: GridView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              children: [
                _buildMetricsCard(
                  title: 'Actual Income',
                  value: '15,000',
                  subValue: '+2,300',
                  icon: Image.asset('assets/icons/metrics_actual_income.png'),
                ),
                _buildMetricsCard(
                  title: 'Actual Expenses',
                  value: '15,000',
                  subValue: '+2,300',
                  icon: Image.asset('assets/icons/metrics_actual_exp.png'),
                ),
                _buildMetricsCard(
                  title: 'Forecast Income',
                  value: '15,000',
                  subValue: '+2,300',
                  icon: Image.asset('assets/icons/metrics_forecast_income.png'),
                ),
                _buildMetricsCard(
                  title: 'Forecast Expenses',
                  value: '15,000',
                  subValue: '+2,300',
                  icon: Image.asset('assets/icons/metrics_forecast_exp.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMetricsCard({
    required String title,
    required String value,
    required String subValue,
    required Widget icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              '₱$value',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorPalette.primaryDark,
              ),
            ),
            Text(
              subValue,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: ColorPalette.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
