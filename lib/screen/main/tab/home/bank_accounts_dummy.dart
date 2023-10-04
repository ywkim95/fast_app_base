import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(
    bank: bankShinhan, balance: 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 =
    BankAccount(bank: bankShinhan, balance: 30000000, accountTypeName: '저축예금');
final bankAccountShinhan3 =
    BankAccount(bank: bankShinhan, balance: 300000000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(bank: bankTtoss, balance: 5000000);
final bankAccountKakao =
    BankAccount(bank: bankKakao, balance: 7000000, accountTypeName: '입출금통장');

// main() {
//   for (var item in bankAccounts) {
//     print(item.accountTypeName);
//   }
//   for (var entry in bankMap.entries) {
//     print(
//         '${entry.key} : ${entry.value.accountTypeName ?? entry.value.bank.name}');
//   }

//   // O(1)
//   // 해당값이 가지고있는 해시태그를 참조하여 검색
//   print(bankSet.contains(bankAccountShinhan1));

//   /// set -> list : set.toList()
//   /// list -> set : list.toSet()

//   // O(n)
//   // 해당값이 존재하는지 리스트 전체를 검색
//   print(bankAccounts.contains(bankAccountShinhan1));
// }

// List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];

// Map
final bankMap = {
  'shinhan1': bankAccountShinhan1,
  'shinhan2': bankAccountShinhan2,
};

// Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
};
