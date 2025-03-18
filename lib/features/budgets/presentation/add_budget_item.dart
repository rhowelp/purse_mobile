import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/custom_button.dart';
import 'package:purse_mobile/core/widgets/custom_textformfield.dart';
import 'package:purse_mobile/features/budgets/data/models/budget_item_model.dart';
import 'package:purse_mobile/features/budgets/presentation/sub_screens/categories.dart';

class AddBudgetItem extends StatefulWidget {
  static const route = 'AddBudgetItem';
  static const routeName = 'AddBudgetItem';

  const AddBudgetItem({super.key});

  @override
  State<AddBudgetItem> createState() => _AddBudgetItemState();
}

class _AddBudgetItemState extends State<AddBudgetItem> {
  final currencyController = TextEditingController();
  final categoryController = TextEditingController();
  Currency? selectedCurrency;
  String selectedBudgetType = 'Monthly';
  String selectedBudgetScope = 'This Week';

  List<BudgetItem> budgeItemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.homeBackgroundColor,
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
                    'Add Budget Item',
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
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item Name',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            CustomTextFormField(
              hintText: 'Enter Item Name',
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Gap(10),
                      CustomTextFormField(
                        hintText: 'Enter Amount',
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Currency',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Gap(10),
                      CustomTextFormField(
                        controller: currencyController,
                        prefixIcon: selectedCurrency == null
                            ? null
                            : SizedBox(
                                height: 20,
                                width: 20,
                                child: Center(
                                  child: Text(
                                    selectedCurrency?.symbol ?? '',
                                    style:
                                        GoogleFonts.inter(color: Colors.black),
                                  ),
                                ),
                              ),
                        hintText: 'PHP',
                        readOnly: true,
                        onTap: () {
                          showCurrencyPicker(
                            context: context,
                            showFlag: true,
                            showCurrencyName: true,
                            showCurrencyCode: true,
                            onSelect: (Currency currency) {
                              setState(() {
                                selectedCurrency = currency;
                                currencyController.text = currency.code;
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(20),
            Text(
              'Categories',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            CustomTextFormField(
              controller: categoryController,
              hintText: 'Select Category',
              suffixIcon: Icon(Icons.arrow_drop_down_rounded),
              readOnly: true,
              onTap: () {
                context.pushNamed(BudgetCategories.routeName);
              },
            ),
            const Gap(20),
            Text(
              'Account',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            CustomTextFormField(
              controller: categoryController,
              hintText: 'Select Account',
              suffixIcon: Icon(Icons.arrow_drop_down_rounded),
              readOnly: true,
              onTap: () {
                context.pushNamed(BudgetCategories.routeName);
              },
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
