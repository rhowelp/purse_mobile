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
    Account(
      name: "GCash",
      type: "Digital Cash",
      icon: "assets/images/gcash.png",
      balance: 130000,
    ),
    Account(
      name: "GCash",
      type: "Digital Cash",
      icon: "assets/images/gcash.png",
      balance: 130000,
    ),
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
          const Spacer(),
          _buildAccountList(),
        ],
      ),
    );
  }

  Widget _buildAccountList() {
    return Expanded(
      child: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   right: 0,
          //   child: _buildAddAccountButton(),
          // ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 40),
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildAddAccountButton();
              }
              return _buildAccountItem(accounts[index], index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddAccountButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({super.key});

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends State<AccountScreen> {
//   final List<Account> accounts = [
//     Account(
//         name: "BDO Unibank",
//         type: "Savings",
//         balance: "₱16,000",
//         logo: "assets/images/bdo.png"),
//     Account(
//         name: "BPI",
//         type: "Credit card",
//         balance: "₱130,000",
//         logo: "assets/images/bpi.png"),
//     Account(
//         name: "GCash",
//         type: "Digital Cash",
//         balance: "₱130,000",
//         logo: "assets/images/gcash.png"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Column(
//         children: [
//           const SizedBox(height: 50),
//           BalanceCard(),
//           const SizedBox(height: 20),
//           Expanded(
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 0,
//                   left: 20,
//                   right: 20,
//                   child: AddAccountButton(),
//                 ),
//                 ListView.builder(
//                   padding: EdgeInsets.only(top: 40),
//                   itemCount: accounts.length,
//                   itemBuilder: (context, index) {
//                     return AccountCard(account: accounts[index], index: index);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Account {
//   final String name;
//   final String type;
//   final String balance;
//   final String logo;

//   Account(
//       {required this.name,
//       required this.type,
//       required this.balance,
//       required this.logo});
// }

// class BalanceCard extends StatelessWidget {
//   const BalanceCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade900, Colors.green.shade700],
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Total Balance",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "₱616,000.00",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddAccountButton extends StatelessWidget {
//   const AddAccountButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 5,
//             offset: Offset(0, 3),
//           )
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.add_circle, color: Colors.green),
//               SizedBox(width: 10),
//               Text(
//                 "Add Account",
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           Icon(
//             Icons.visibility_off,
//             color: Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AccountCard extends StatelessWidget {
//   final Account account;
//   final int index;

//   const AccountCard({super.key, required this.account, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Transform.translate(
//       offset: Offset(0, -index * 25),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         child: Container(
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(25),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 5,
//                 offset: Offset(0, 3),
//               )
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: AssetImage(account.logo),
//                     radius: 20,
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(account.name,
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold)),
//                       Text(account.type, style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                 ],
//               ),
//               Text(account.balance,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
