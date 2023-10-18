import 'package:fast_app_base/common/dart/extension/collection_extension.dart';
import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(1,
    bank: bankShinhan, balance: 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(2,
    bank: bankShinhan, balance: 30000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(3,
    bank: bankShinhan, balance: 300000000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(4, bank: bankTtoss, balance: 5000000);
final bankAccountKakao =
    BankAccount(5, bank: bankKakao, balance: 7000000, accountTypeName: '입출금통장');
final bankAccountKakao2 =
    BankAccount(6, bank: bankKakao, balance: 10000000, accountTypeName: '특별통장');

abstract class Animal {
  void eat();
}

class Dog extends Animal {
  @override
  void eat() {}
}

class Cat extends Animal {
  @override
  void eat() {}
}

class Cow extends Animal {
  @override
  void eat() {}
}

void main() {
  // 삽입
  bankAccounts.insert(1, bankAccountKakao2);

  // 위치이동
  final temp = bankAccounts.removeAt(9);
  bankAccounts.insert(0, temp);

  //교환
  bankAccounts.swap(0, 10);

  //변환
  final banks = bankAccounts.map((e) => e.bank).toList();
  // final banks2 = bankAccounts
  //     .mapIndexed((element, index) => Row(
  //           children: [(index + 1).text.make()],
  //         ))
  //     .toList();
  // for (final bank in banks) {
  //   print(bank.toString());
  // }

  // final map = HashMap<String, BankAccount>();
  // map['ttoss'] = bankAccountToss;
  // map['kakao'] = bankAccountKakao;
  // map.putIfAbsent('kakao', () => bankAccountKakao2);
  // if(!map.containsKey('kakao')){
  //   map['kakao'] = bankAccountKakao2;
  // }

  // final ttossAccount = map['ttoss'];

  //
  final uniqueBanks = banks.toSet();
  for (final bank in uniqueBanks) {
    print(bank.toString());
  }
  // for (final account in bankAccounts) {
  //   print(account.toString());
  // }
}
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
