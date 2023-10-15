import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_popular_stock.dart';
import 'package:flutter/material.dart';

class PopularStockItem extends StatelessWidget {
  final int number;
  final PopularStock popularStock;
  const PopularStockItem({
    super.key,
    required this.number,
    required this.popularStock,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: number.text.bold.white.size(16.0).make(),
        ),
        width20,
        popularStock.name.text.bold.white.size(16.0).make(),
        emptyExpanded,
        popularStock.todayPercentageString.text
            .color(popularStock.getPriceColor(context))
            .size(16.0)
            .make(),
      ],
    ).pSymmetric(v: 25);
  }
}
