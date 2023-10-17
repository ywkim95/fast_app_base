import 'dart:async';

import 'package:fast_app_base/screen/future_test.dart';

void main() {
  /// Stream 기본 개념
  /// Future - 1번의 데이터를 가져옴
  /// Stream - 여러 번의 데이터를 받을 수 있음

  /// Stream 생성과 수행
  /// 1. async*
  /// 2. StreamController

  // final controller = StreamController<int>();
  // final stream = controller.stream;
  // stream.listen((event) {
  //   print(event);
  // });
  // addDataToTheSink(controller);

  /// Stream 데이터 변환
  // countStream(4).map((event) => '$event 초가 지났습니다.').listen((event) {
  //   print(event);
  // });
  // countStream(4).transform(utf8.decoder).listen((event) {
  //   print(event);
  // });
  /// 위젯에서 Stream Data 표현하기

  /// Stream 데이터 관찰2 - BroadcastStream

  // final broadCastStream = countStream(5).asBroadcastStream();
  // broadCastStream.listen((event) {
  //   print(event);
  // });
  // Future.delayed(const Duration(seconds: 2), () {
  //   broadCastStream.listen((event) {
  //     print('방송 2초 후 : $event');
  //   });
  // });

  /// 2개의 위젯에서 하나의 BroadcastStream Data 표현하기

  /// Stream Error Handling
  countStream(5).listen(
    (event) {
      print(event);
    },
    cancelOnError: false,
  ).onError((err, stackTrace) {
    print(err.toString());
  });
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    controller.sink.add(i);
    await sleepAsync(const Duration(seconds: 1));
  }
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    if (i == 2) {
      // throw Exception('에러 발생~');
      yield* Stream.error(Exception('에러 발생~'));
    } else {
      yield i;
    }

    await sleepAsync(const Duration(seconds: 1));
  }
}
