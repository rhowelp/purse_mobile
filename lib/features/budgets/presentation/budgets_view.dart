import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class BudgetsView extends StatefulWidget {
  const BudgetsView({super.key});

  @override
  State<BudgetsView> createState() => _BudgetsViewState();
}

class BarData {
  final String month;
  final int value;

  BarData({required this.month, required this.value});
}

class _BudgetsViewState extends State<BudgetsView> {
  bool isBalanceShow = true;
  final sampleData = [
    BarData(month: "Sep", value: 2),
    BarData(month: "Oct", value: 2),
    BarData(month: "Now", value: 2),
    BarData(month: "Dec", value: 12),
    BarData(month: "Jan", value: 23),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.homeBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 130,
            child: Container(
              color: ColorPalette.homeBackgroundColor,
              child: Column(
                children: [
                  const Gap(kToolbarHeight + 20),
                  Row(
                    children: [
                      const Gap(5),
                      // IconButton(
                      //   onPressed: () {
                      //     context.pop();
                      //   },
                      //   icon: const Icon(
                      //     Icons.chevron_left_rounded,
                      //     size: 40,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      const Gap(20),
                      const Text(
                        'Budgets',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/home_top_background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monthly Budget',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                isBalanceShow ? '₱15,000.00' : '*****',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
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
                                  isBalanceShow
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Left of credit card ₱75,000',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    MoneyOutWidget(barData: sampleData),
                    const Gap(20),
                    Column(
                      children: [
                        _buildBudgetsRouteCard(
                          title: 'Set Primary Budget',
                          onPressed: () {},
                        ),
                        const Gap(10),
                        _buildBudgetsRouteCard(
                          title: 'Set My Spending',
                          onPressed: () {},
                        ),
                        const Gap(10),
                        _buildBudgetsRouteCard(
                          title: 'Disposable Budget',
                          onPressed: () {},
                        ),
                        const Gap(10),
                        _buildBudgetsRouteCard(
                          title: 'View Spending Habits',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetsRouteCard({
    required String title,
    required Function() onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorPalette.grey.withOpacity(0.1),
              blurRadius: 25,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset('assets/icons/wallet_icon.png'),
            const Gap(10),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class MoneyOutWidget extends StatelessWidget {
  const MoneyOutWidget({super.key, required this.barData});
  final List<BarData> barData;

  @override
  Widget build(BuildContext context) {
    int maxValue = barData.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Money out",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        "View",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Gap(5),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: barData
                .map((data) => _buildBar(
                    data.value, data.month, data.value / maxValue * 100))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(int value, String month, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "$value",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Gap(5),
        ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: Container(
            width: 30,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        const Gap(5),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey,
              width: 1.5,
            ),
          ),
          child: Text(
            month,
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
