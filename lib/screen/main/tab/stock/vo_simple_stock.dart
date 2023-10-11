class SimpleStock {
  final String stockName;
  SimpleStock({
    required this.stockName,
  });

  factory SimpleStock.fromJson(Map<String, dynamic> json) {
    return SimpleStock(stockName: json['name']);
  }

  @override
  String toString() {
    return stockName;
  }
}
