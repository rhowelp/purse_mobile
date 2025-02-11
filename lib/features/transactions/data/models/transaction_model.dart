class Transaction {
  final String title;
  final String account;
  final String time;
  final String location;
  final double amount;
  final String type; // Digital, Cash, Credit
  final String icon; 

  Transaction({
    required this.title,
    required this.account,
    required this.time,
    required this.location,
    required this.amount,
    required this.type,
    required this.icon,
  });
}