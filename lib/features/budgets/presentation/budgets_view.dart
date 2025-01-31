import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class BudgetsView extends StatefulWidget {
  const BudgetsView({super.key});

  @override
  State<BudgetsView> createState() => _BudgetsViewState();
}

class _BudgetsViewState extends State<BudgetsView> {
  bool isBalanceShow = true;

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
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/home_top_background.png'),
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Money out'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
