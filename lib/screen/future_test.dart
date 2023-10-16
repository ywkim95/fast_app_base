import 'dart:async';

import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

void main() async {
  // Future의 생성과 수행
  // print('start');
  // final account = await getBankAccount();
  // print('end');

  // Future Timeout
  // print('start');
  // final account = await getBankAccount()
  //     .timeout(const Duration(seconds: 1))
  //     .onError((error, stackTrace) => []);
  // print(account);
  // print('end');

  // Future Error handling
  print('start');
  // try {
  //   // final account = await getBankAccount().timeout(const Duration(seconds: 1));
  //   // .onError((error, stackTrace) => []);

  //   // print(account);
  // } catch (e) {
  //   print(e);
  // }
  getBankAccount()
      .timeout(const Duration(seconds: 1))
      .then((value) => print(value))
      .catchError((error, stackTrace) {
    print(error);
    print(stackTrace);
  });

  print('end');
  // FutureOr
}

abstract class DoWorkInterface {
  FutureOr doWork();
}

class SyncWork extends DoWorkInterface {
  @override
  void doWork() {}
}

class AsyncWork extends DoWorkInterface {
  @override
  FutureOr doWork() async {}
}

Future<List<BankAccount>> getBankAccount() async {
  await Future.delayed(const Duration(seconds: 2));
  return bankAccounts;
}
