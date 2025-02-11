import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountBottomSheet extends StatefulWidget {
  const AccountBottomSheet({super.key});

  @override
  State<AccountBottomSheet> createState() => _AccountBottomSheetState();
}

class _AccountBottomSheetState extends State<AccountBottomSheet> {
  String selectedAccount = "Cash";

  final accounts = <Map<String, dynamic>>[
    {
      "name": "Cash",
      "icon": 'assets/icons/svg/cash_active.svg',
      "inactive_icon": 'assets/icons/svg/cash_inactive.svg',
    },
    {
      "name": "Digital",
      "icon": 'assets/icons/svg/digital_active.svg',
      "inactive_icon": 'assets/icons/svg/digital_inactive.svg',
    },
    {
      "name": "Credit",
      "icon": 'assets/icons/svg/credit_active.svg',
      "inactive_icon": 'assets/icons/svg/credit_inactive.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, 'Account'),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: accounts.map((account) {
              bool isSelected = selectedAccount == account['name'];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAccount = account['name'];
                  });
                },
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        isSelected ? account['icon'] : account['inactive_icon'],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        account['name'],
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
