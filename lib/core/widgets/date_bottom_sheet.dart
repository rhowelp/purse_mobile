import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class DateFilterBottomSheet extends StatefulWidget {
  const DateFilterBottomSheet({super.key});

  @override
  State<DateFilterBottomSheet> createState() => _DateFilterBottomSheetState();
}

class _DateFilterBottomSheetState extends State<DateFilterBottomSheet> {
  String selectedFilter = "This Week";
  final List<String> filters = [
    "Today",
    "This Week",
    "This Month",
    "This Year",
    "Custom Date Range"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, "Date"),
          Column(
            children: filters.map((filter) {
              return RadioListTile(
                title: Text(
                  filter,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                value: filter,
                groupValue: selectedFilter,
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value.toString();
                  });
                },
              );
            }).toList(),
          ),
          if (selectedFilter == "Custom Date Range") ...[
            Row(
              children: [
                Expanded(child: _buildDatePicker("Feb 05, 2025")),
                const SizedBox(width: 10),
                Expanded(child: _buildDatePicker("Feb 15, 2025")),
              ],
            ),
          ],
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildDatePicker(String initialDate) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorPalette.grey,
        elevation: 0,
      ),
      child: Text(
        initialDate,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
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
