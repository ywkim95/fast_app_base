import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

class BankAccount {
  final int userId;
  final Bank bank;
  int balance;
  final String? accountTypeName;

  BankAccount(
    this.userId, {
    required this.bank,
    required this.balance,
    this.accountTypeName,
  });
  @override
  String toString() {
    return 'BankAccount(bank: $bank, balace: $balance, accountTypeName: $accountTypeName)';
  }
}
