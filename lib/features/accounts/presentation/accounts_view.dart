import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/features/accounts/data/models/account_model.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

class BarData {
  final String month;
  final int value;

  BarData({required this.month, required this.value});
}

class _AccountsViewState extends State<AccountsView> {
  bool isBalanceShow = true;
  List<Account> accounts = [
    Account(
      name: "BDO Unibank",
      type: "Savings",
      icon: "assets/images/bdo.png",
      balance: 16000,
    ),
    Account(
      name: "BPI",
      type: "Credit card",
      icon: "assets/images/bpi.png",
      balance: 130000,
    ),
    Account(
      name: "GCash",
      type: "Digital Cash",
      icon: "assets/images/gcash.png",
      balance: 130000,
    ),
    // Account(
    //   name: "GCash",
    //   type: "Digital Cash",
    //   icon: "assets/images/gcash.png",
    //   balance: 130000,
    // ),
    // Account(
    //   name: "GCash",
    //   type: "Digital Cash",
    //   icon: "assets/images/gcash.png",
    //   balance: 130000,
    // ),
  ];

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
                  const Text(
                    'Accounts',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('assets/images/home_top_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly Budget',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildAccountList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: _buildAddAccountButton(),
          // ),
          ClipRRect(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 3),
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildAddAccountButton();
                }
                return _buildAccountItem(accounts[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddAccountButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        title: const Text(
          "Add Account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        trailing: const Icon(
          Icons.visibility_off,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildAccountItem(Account account, int index) {
    return Transform.translate(
      offset: Offset(0, -index * 12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 0,
              offset: Offset(0.0, -2),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(account.icon),
          ),
          title: Text(
            account.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(account.type),
          trailing: Text(
            "₱${account.balance.toStringAsFixed(0)}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
