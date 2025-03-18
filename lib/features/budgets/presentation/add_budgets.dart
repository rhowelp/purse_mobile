import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/custom_button.dart';
import 'package:purse_mobile/core/widgets/custom_textformfield.dart';
import 'package:purse_mobile/features/budgets/data/models/budget_item_model.dart';
import 'package:purse_mobile/features/budgets/presentation/add_budget_item.dart';

class AddBudgets extends StatefulWidget {
  static const route = '/AddBudgets';
  static const routeName = 'AddBudgets';

  const AddBudgets({super.key});

  @override
  State<AddBudgets> createState() => _AddBudgetsState();
}

class _AddBudgetsState extends State<AddBudgets> {
  String _selectedBudgetType = 'Monthly';
  String _selectedBudgetScope = 'This Week';

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
                    'Add Budget',
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
              'Budget Name',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            CustomTextFormField(
              hintText: 'Enter Budget Name',
            ),
            const Gap(20),
            Text(
              'Budget Type',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: _buildBudgetType(
                    title: 'Monthly',
                    isSelected: _selectedBudgetType == 'Monthly',
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: _buildBudgetType(
                    title: 'One Time',
                    isSelected: _selectedBudgetType == 'One Time',
                  ),
                ),
              ],
            ),
            const Gap(20),
            Text(
              'Budget Scope',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(10),
            DropdownButtonFormField<String>(
              value: _selectedBudgetScope,
              items: ["This Week", "This Month"]
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )))
                  .toList(),
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const Gap(20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Budget Items',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Edit >'),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: budgeItemList.length,
                    itemBuilder: (context, i) {
                      return Text(i.toString());
                    },
                  ),
                  CustomButton(
                    onTap: () {
                      context.pushNamed(AddBudgetItem.routeName);
                    },
                    buttonHeight: 35,
                    buttonColor: ColorPalette.lightBlue.withOpacity(0.3),
                    child: Text(
                      'Add Item +',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: ColorPalette.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetType({
    required String title,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBudgetType = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? ColorPalette.primary : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
