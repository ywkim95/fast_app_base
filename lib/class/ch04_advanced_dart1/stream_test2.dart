void main() {
  // final List list = ['blue', 'yellow', 'red'];
  // final iterator = list.iterator;
  // // print(iterator.current);
  // // while (iterator.moveNext()) {
  // //   print(iterator.current);
  // // }
  // for (var element in list) {
  //   print(element);
  // }
  // for (final color in [1, 2, 3, 4, 5]) {
  //   print(color);
  // }
  for (final message in countIterable(5)) {
    print(message);
  }
}

Iterable<String> countIterable(int max) sync* {
  for (int i = 1; i <= max; i++) {
    yield i.toString();
  }
  yield '안녕하세요';

  yield* ['1', '2', '3', '4'];
}

Stream<String> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await sleepAsync(const Duration(seconds: 1));
    yield i.toString();
  }
  yield '안녕하세요';
  yield* countStream(to);
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
