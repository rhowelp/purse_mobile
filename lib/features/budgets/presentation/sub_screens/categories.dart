import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class BudgetCategories extends StatefulWidget {
  static const route = 'BudgetCategories';
  static const routeName = 'BudgetCategories';
  const BudgetCategories({super.key});

  @override
  State<BudgetCategories> createState() => BudgetCategoriesState();
}

class BudgetCategoriesState extends State<BudgetCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 75),
        child: Container(
          color: ColorPalette.homeBackgroundColor,
          child: Column(
            children: [
              const Gap(kToolbarHeight + 14),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(20),
                  Text(
                    'Categories',
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
      body: Column(
        children: [],
      ),
    );
  }
}
