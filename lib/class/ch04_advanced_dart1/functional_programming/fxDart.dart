import 'package:fast_app_base/class/ch04_advanced_dart1/functional_programming/functions/reduce.dart';

fxDart(List args) async {
  await reduce((a, f) async {
    if (a is Future) {
      return f(await a);
    }
    return f(a);
  }, args);
}
