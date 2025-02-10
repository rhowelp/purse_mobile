import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/features/transactions/data/models/transaction_model.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class BarData {
  final String month;
  final int value;

  BarData({required this.month, required this.value});
}

class _TransactionsViewState extends State<TransactionsView> {
  bool isBalanceShow = true;
  bool isFilterExpanded = false;

  List<Transaction> transactions = [
    Transaction(
      title: "Bills",
      account: "BDO",
      time: "8:51 AM",
      location: "Pasig City",
      amount: 16000,
      type: "Cash",
      icon: "assets/icons/svg/cash_active.svg",
    ),
    Transaction(
      title: "Bills",
      account: "BPI",
      time: "8:51 AM",
      location: "Pasig City",
      amount: 19000,
      type: "Cash",
      icon: "assets/icons/svg/cash_active.svg",
    ),
    Transaction(
      title: "Bills",
      account: "GCash",
      time: "8:51 AM",
      location: "Pasig City",
      amount: 8000,
      type: "Digital",
      icon: "assets/icons/svg/digital_active.svg",
    ),
    Transaction(
      title: "Bills",
      account: "GCash",
      time: "8:51 AM",
      location: "Pasig City",
      amount: 4000,
      type: "Digital",
      icon: "assets/icons/svg/digital_active.svg",
    ),
    Transaction(
      title: "Bills",
      account: "GCash",
      time: "8:51 AM",
      location: "Pasig City",
      amount: 2000,
      type: "Digital",
      icon: "assets/icons/svg/digital_active.svg",
    ),
    Transaction(
      title: "Bills",
      account: "GCash",
      time: "8:51 AM",
      location: "Pasig City",
      amount: 3000,
      type: "Credit",
      icon: "assets/icons/svg/credit_active.svg",
    ),
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
                        'Transactions',
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
                      padding: const EdgeInsets.all(25),
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
                          Row(
                            children: [
                              Text(
                                isBalanceShow ? '₱15,000.00' : '*****',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
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
                          const Gap(30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total In',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Text(
                                                '₱15,000',
                                                style: GoogleFonts.inter(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.bolt_rounded,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Total Out',
                                            style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            '₱15,000',
                                            style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.bolt_rounded,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Gap(20),
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
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            elevation: 0,
                          ),
                          icon: Icon(Icons.filter_list),
                          label: Text("Filter"),
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
                                _filterOption(text: "Amount", isIcon: true),
                                _filterOption(text: "Category"),
                                _filterOption(text: "Account"),
                                _filterOption(text: "Date Range"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: transactions.length,
                      separatorBuilder: (context, index) => const Gap(10),
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];

                        // Define color based on transaction type
                        Color amountColor;
                        switch (transaction.type) {
                          case "Digital":
                            amountColor = Colors.blue;
                            break;
                          case "Cash":
                            amountColor = ColorPalette.red;
                            break;
                          case "Credit":
                            amountColor = Colors.red;
                            break;
                          default:
                            amountColor = Colors.black;
                        }

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: SvgPicture.asset(transaction.icon),
                            title: Text(
                              transaction.title,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              "${transaction.account} • ${transaction.time} • ${transaction.location}",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₱${transaction.amount.toStringAsFixed(0)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: amountColor,
                                  ),
                                ),
                                Text(
                                  transaction.type,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: amountColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
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

  Widget _filterOption({required String text, bool isIcon = false}) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: isFilterExpanded ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: isIcon
            ? IconButton(
                onPressed: () {},
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                child: Text(text),
              ),
      ),
    );
  }

  Widget _buildTransactionsCard({
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
            SvgPicture.asset(
              'assets/icons/svg/cash_active.svg',
            ),
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
