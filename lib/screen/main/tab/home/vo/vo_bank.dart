class Bank {
  final String name;
  final String logoImagePath;

  Bank({
    required this.name,
    required this.logoImagePath,
  });
  @override
  String toString() {
    return 'Bank(name: $name, logoImagePath: $logoImagePath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Bank && other.name == name;
  }
}
