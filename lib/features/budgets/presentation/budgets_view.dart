import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/enums/enums.dart';
import 'package:purse_mobile/core/widgets/account_bottom_sheet.dart';
import 'package:purse_mobile/core/widgets/category_bottom_sheet.dart';
import 'package:purse_mobile/core/widgets/date_bottom_sheet.dart';
import 'package:purse_mobile/features/budgets/presentation/add_budgets.dart';

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
  bool isFilterExpanded = false;
  final sampleData = [
    BarData(month: "Sep", value: 2),
    BarData(month: "Oct", value: 2),
    BarData(month: "Now", value: 2),
    BarData(month: "Dec", value: 12),
    BarData(month: "Jan", value: 23),
  ];

  void showCustomBottomSheet(BuildContext context, BottomSheetType type) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        switch (type) {
          case BottomSheetType.category:
            return CategoryBottomSheet();
          case BottomSheetType.dateFilter:
            return DateFilterBottomSheet();
          case BottomSheetType.account:
            return AccountBottomSheet();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.homeBackgroundColor,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: ColorPalette.primary,
        onPressed: () {
          context.pushNamed(AddBudgets.routeName);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
                      Text(
                        'Budgets',
                        style: GoogleFonts.inter(
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
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/home_top_background.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Amount you can spend',
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    isBalanceShow ? '₱15,000.00' : '*****',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    'Total Budgets ₱50,000',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 75,
                                child: const VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                  width: 2,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total spent',
                                    style: GoogleFonts.inter(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    isBalanceShow ? '₱15,000.00' : '*****',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const Gap(5),
                                  Text(
                                    '15 days | End of Month',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white60.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Categories Total',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                      ),
                                    ),
                                    Text(
                                      '₱14,000 spent in month Feb 11 to Mar 11',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(5),
                                LinearPercentIndicator(
                                  animation: true,
                                  animationDuration: 1000,
                                  lineHeight: 15,
                                  percent: 0.4,
                                  center: Text(
                                    '₱14,000 of ₱26,000',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 8,
                                    ),
                                  ),
                                  padding: EdgeInsets.zero,
                                  barRadius: Radius.circular(30),
                                  progressColor: Colors.red,
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isFilterExpanded = !isFilterExpanded;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 0,
                          ),
                          icon: Icon(Icons.filter_list),
                          label: Text(
                            "Filter",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Gap(5),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          width: isFilterExpanded ? 250 : 0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _filterOption(
                                  text: "Amount",
                                  isIcon: true,
                                  onPressed: () {},
                                ),
                                _filterOption(
                                  text: "Category",
                                  onPressed: () {
                                    showCustomBottomSheet(
                                        context, BottomSheetType.category);
                                  },
                                ),
                                _filterOption(
                                  text: "Account",
                                  onPressed: () {
                                    showCustomBottomSheet(
                                        context, BottomSheetType.account);
                                  },
                                ),
                                _filterOption(
                                  text: "Date Range",
                                  onPressed: () {
                                    showCustomBottomSheet(
                                        context, BottomSheetType.dateFilter);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                    // MoneyOutWidget(barData: sampleData),
                    Column(
                      children: [
                        _buildBudgetsRouteCard(
                          title: 'Set Primary Budget',
                          spent: 2000,
                          total: 6000,
                          color: Color(0xFF5AE185),
                          icon: Icons.attach_money_outlined,
                          onPressed: () {},
                        ),
                        const Gap(10),
                        _buildBudgetsRouteCard(
                          title: 'Set My Spending',
                          spent: 6500,
                          total: 5000,
                          color: Color(0xFF18DDB6),
                          icon: Icons.attach_money_outlined,
                          onPressed: () {},
                        ),
                        const Gap(10),
                        _buildBudgetsRouteCard(
                          title: 'Disposable Budget',
                          spent: 1500,
                          total: 2500,
                          color: Color(0xFFF9CD5C),
                          icon: Icons.attach_money_outlined,
                          onPressed: () {},
                        ),
                        const Gap(10),
                        _buildBudgetsRouteCard(
                          title: 'View Spending Habits',
                          spent: 1500,
                          total: 3500,
                          color: Color(0xFF25CFEC),
                          icon: Icons.attach_money_outlined,
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

  Widget _filterOption(
      {required String text,
      bool isIcon = false,
      required Function() onPressed}) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: isFilterExpanded ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: isIcon
            ? IconButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 5,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.zero,
                ),
                icon: Icon(Icons.swap_vert_outlined),
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildBudgetsRouteCard({
    required String title,
    required double spent,
    required double total,
    required Color color,
    required IconData icon,
    required Function() onPressed,
  }) {
    final totalRemaining = total - spent;
    final isExceeded = spent > total;
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
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '₱$total',
                        style: GoogleFonts.inter(
                          color: ColorPalette.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Spent ₱$spent',
                        style: GoogleFonts.inter(
                          color: ColorPalette.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Left ₱$totalRemaining',
                        style: GoogleFonts.inter(
                          color: ColorPalette.grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 15,
                    percent: isExceeded ? 1 : totalRemaining / total,
                    center: Text(
                      '₱$spent',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    barRadius: Radius.circular(30),
                    progressColor: color,
                    backgroundColor: ColorPalette.grey.withOpacity(0.2),
                  ),
                ],
              ),
            ),
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
                        style: GoogleFonts.inter(
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
          style: GoogleFonts.inter(
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
            style: GoogleFonts.inter(
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
