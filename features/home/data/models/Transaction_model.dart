class Transaction {
  final TransactionType type;
  final String description;
  final double amount;
  final DateTime date;

  Transaction({
    required this.type,
    required this.description,
    required this.amount,
    required this.date,
  });
}

enum TransactionType {
  income,
  expense,
}
