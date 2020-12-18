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
            margin: EdgeInsets.only(top: 10,right: 10),
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ThemeColor.positive),
                  borderRadius: BorderRadius.circular(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                        child: Text(
                          bucketList[index].name,

                            style: TextStyle(color: ThemeColor.positive, fontSize: 16),
                        )),
                  ),

                  Expanded(
                    flex: 1,
                      child : Center(child: Text("11",         style: TextStyle(color: ThemeColor.positive, fontSize: 16),))),

                  Expanded(    flex: 2,child: Center(child: Text("2210",         style: TextStyle(color: ThemeColor.positive, fontSize: 16),))),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: ButtonTheme(
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
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: ButtonTheme(
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
                    ),
                  ),
                ],
              ),
            ),
          );

      },
    );
  }
}
