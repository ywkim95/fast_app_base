import 'package:meta/meta.dart';

abstract class AbstractRectangular {
  double get height;
  double get width;
}

class Rectangular extends AbstractRectangular {
  @override
  double height;
  @override
  double width;

  Rectangular(this.width, this.height);
  @nonVirtual
  double getArea() {
    return height * width;
  }
}

class Rect extends Rectangular {
  Rect(super.width, super.height);
}

class Square extends AbstractRectangular {
  double side;

  Square(this.side);
  @override
  double get height => side;
  @override
  double get width => side;
}

main() {
  // final square = Square(10);
  // square.height = 40;

  final AbstractRectangular rectangular = getRectangular();

  print(rectangular.width);
  print(rectangular.height);

  if (rectangular is Rectangular) {
    rectangular.height = 50;
  } else if (rectangular is Square) {
    rectangular.side = 50;
  }

  switch (rectangular) {
    case Rectangular():
      rectangular.height = 50;
      break;
    case Square():
      rectangular.side = 40;
      break;
  }

  print(rectangular.width);
}

AbstractRectangular getRectangular() {
  return Square(10);
}
