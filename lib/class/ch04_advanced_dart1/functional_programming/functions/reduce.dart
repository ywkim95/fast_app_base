Function reduce =
    <E>(E Function(E value, E element) combine, Iterable<E> iterable) {
  Iterator<E> iterator = iterable.iterator;
  if (!iterator.moveNext()) {
    // throw IterableElementError.noElement();
  }
  E value = iterator.current;
  while (iterator.moveNext()) {
    value = combine(value, iterator.current);
  }
  return value;
};

void main() {
  print(reduce<int>(multiply, [1, 2, 3, 4, 5, 6]));
}

int add(int a, int b) => a + b;
int multiply(int a, int b) => a * b;
