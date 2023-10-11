import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/search_stock_data.dart';
import 'package:flutter/material.dart';

class SearchAutoCompleteList extends StatelessWidget
    with SearchStockDataProvider {
  SearchAutoCompleteList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchData.autoCompleteList.length,
      itemBuilder: (context, index) {
        return Tap(
            onTap: () {},
            child:
                searchData.autoCompleteList[index].stockName.text.make().p(20));
      },
    );
  }
}
