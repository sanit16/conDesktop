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

          return Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ThemeColor.positive),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        bucketList[index].name,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      )),
                  ButtonTheme(
                    buttonColor: ThemeColor.white,
                    minWidth: 30,
                    height: 30,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                              color: ThemeColor.positive, width: 2)),
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: ThemeColor.positive,
                      ),
                    ),
                  ),
                  Center(child: Text("11")),
                  ButtonTheme(
                    buttonColor: ThemeColor.white,
                    minWidth: 30,
                    height: 30,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                              color: ThemeColor.negative, width: 2)),
                      onPressed: () {},
                      child: Icon(
                        Icons.remove,
                        color: ThemeColor.negative,
                      ),
                    ),
                  ),
                  Center(child: Text("2210")),
                ],
              ),
            ),
          );

      },
    );
  }
}
