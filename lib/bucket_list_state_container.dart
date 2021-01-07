import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';

import 'data_object/product/product.dart';

class BucketListStateContainer extends StatelessWidget {
  const BucketListStateContainer({
    Key key,
    @required this.bucketList,
  }) : super(key: key);

  final List<Product> bucketList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bucketList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {

          return Row(
            children: [
              Text(
                bucketList[index].name,

                style: TextStyle(color: ThemeColor.positive, fontSize: 16),
              ),
              Text(
                '${bucketList[index].price}',

                style: TextStyle(color: ThemeColor.positive, fontSize: 16),
              ),
              Text(
                "2",

                style: TextStyle(color: ThemeColor.positive, fontSize: 16),
              ),
              Text(
                '${bucketList[index].price*2}',

                style: TextStyle(color: ThemeColor.positive, fontSize: 16),
              ),
            ],
          );

      },
    );
  }
}
