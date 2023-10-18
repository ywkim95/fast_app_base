import 'dart:async';
import 'package:fast_app_base/class/ch04_advanced_dart1/functional_programming/functions/future_map.dart';
import 'package:fast_app_base/class/ch04_advanced_dart1/functional_programming/functions/map.dart';
import 'package:fast_app_base/class/ch04_advanced_dart1/functional_programming/functions/run.dart';
import 'package:fast_app_base/class/ch04_advanced_dart1/functional_programming/fxDart.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_user.dart';

void main() async {
  // Functional Programming

  // 프로그래밍 방법을 부르는 이름들

  // 절차적 프로그래밍 - 명령형 프로그래밍
  // => Accounts => Users => User.name => 출력
  // final accounts = getAccounts();
  // final list = <String>[];
  // for (final account in accounts) {
  //   final user = getUser(account.userId);
  //   list.add(user.name);
  // }
  // print(list);

  // 함수형 프로그래밍 - 선언형 프로그래밍
//   print('start');
//   final nameList = await (await getAccounts())
//       .toStream()
//       .map(accountToUserId)
//       .asyncMap(userIdToFutureUser)
//       .map(userToName)
//       .toList();
//   print(nameList);
//   print('end');
  print('start');
  await fxDart([
    await getAccounts(),
    mapAccountToUserId,
    asyncMapIdToUser,
    mapUserToName,
    printNames,
  ]);
  print('end');
}

printNames(names) => runAll((names) => print(names.toList()), names);

mapUserToName(users) => map((User user) => user.name, users);

asyncMapIdToUser(List<int> userIds) => futureMap(getUser, userIds);

mapAccountToUserId(accounts) =>
    map((BankAccount account) => account.userId, accounts);

// String userToName(e) => e.name;

// FutureOr<User> userIdToFutureUser(e) => getUser(e);

// int accountToUserId(e) => e.userId;

Future<List<BankAccount>> getAccounts() async {
  await sleepAsync(const Duration(milliseconds: 300));
  return bankAccounts;
}

Future<User> getUser(int id) async {
  await sleepAsync(const Duration(milliseconds: 300));
  print('getUser: $id');
  return switch (id) {
    1 => User(id, 'Jason'),
    2 => User(id, 'Dart'),
    3 => User(id, 'Baby'),
    4 => User(id, 'Love'),
    5 => User(id, 'Popcorn'),
    _ => throw Exception('404 not found'),
  };
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
