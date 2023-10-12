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
          child: number.text.make(),
        ),
        width30,
        popularStock.name.text.make(),
        emptyExpanded,
        popularStock.todayPercentageString.text
            .color(popularStock.getPriceColor(context))
            .make(),
      ],
    ).pSymmetric(v: 25);
  }
}
