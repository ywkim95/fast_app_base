class SimpleStock {
  final String name;
  SimpleStock({
    required this.name,
  });

  factory SimpleStock.fromJson(Map<String, dynamic> json) {
    return SimpleStock(name: json['name']);
  }

  @override
  String toString() {
    return name;
  }
}
