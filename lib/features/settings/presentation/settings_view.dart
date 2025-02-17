import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final sectionTitleStyle = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

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
              const Gap(kToolbarHeight + 20),
              Row(
                children: [
                  const Gap(25),
                  Text(
                    'Settings',
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/test_user.png'),
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jordan S.",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Since April 2023",
                        style: GoogleFonts.inter(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Text("My Budget", style: sectionTitleStyle),
              settingsTile(Icons.pie_chart, "Overall Budget"),
              const Gap(16),
              Text("Account", style: sectionTitleStyle),
              settingsTile(Icons.person, "Profile details"),
              settingsTile(Icons.lock, "Security"),
              settingsTile(Icons.tune, "Preferences"),
              settingsTile(Icons.notifications, "Notification"),
              settingsTile(Icons.credit_card, "Cards"),
              const Gap(16),
              Text("Miscellaneous", style: sectionTitleStyle),
              settingsTile(Icons.description, "Term of use"),
              settingsTile(Icons.privacy_tip, "Privacy Policy"),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text(
                  "Sign Out",
                  style: GoogleFonts.inter(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.red,
                  size: 16,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingsTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: GoogleFonts.inter(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: () {},
    );
  }
}
