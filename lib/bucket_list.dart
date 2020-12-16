import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/bucket_list_state_container.dart';
import 'package:desktop/service/api_manager.dart';
import 'package:desktop/event/main_product.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';

class BucketList extends StatefulWidget {
  @override
  _BucketListState createState() => _BucketListState();
}

class _BucketListState extends State<BucketList> {
  MainProduct mainProduct;

  @override
  Widget build(BuildContext context) {
    List<Product> bucketList = new List<Product>();
    bucketList.add(new Product("description", "detail", "group", "head",
        "image", "name", "price", "qrCode", "5", true, "updateDate"));
    bucketList.add(new Product("description", "detail", "group", "head",
        "image", "name2", "price", "qrCode", "5", true, "updateDate"));
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColor.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonTheme(
                    buttonColor: ThemeColor.negative,
                    minWidth: 60,
                    height: 60,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:
                              BorderSide(color: ThemeColor.negative, width: 2)),
                      onPressed: () {},
                      child: Icon(
                        Icons.person_add_alt_1,
                        color: ThemeColor.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      SizedBox(width: 10),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: new BoxDecoration(
                              border: Border.all(
                                  color: ThemeColor.negative, width: 3),
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTm7-cf5bt448scpSwxXFGfj85INPzqIgvFZw&usqp=CAU')))),
                      SizedBox(width: 10),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      'https://www.matichon.co.th/wp-content/uploads/2020/08/%E0%B8%84%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%97%E0%B8%B4%E0%B8%9B-1.jpg')))),
                      SizedBox(width: 10),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      'https://www.prachachat.net/wp-content/uploads/2019/07/timeline_20190704_123238.jpg')))),
                    ]),
                  ),
                ],
              ),
            ),
            RawKeyboardListener(
              autofocus: true,
              child: TextField(),
              focusNode: FocusNode(),
              onKey: (event) async {
                if (event.runtimeType == RawKeyUpEvent) {
                  print(event.logicalKey);
                }
              },
            ),
            Expanded(child: BucketListStateContainer(bucketList: bucketList)),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text('ขาย',
                              style: TextStyle(
                                  fontSize: 18, color: ThemeColor.white))),
                      color: ThemeColor.positive,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: FlatButton(
                    onPressed: null,
                    child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text('ยกเลิก',
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.positive))),
                    textColor: ThemeColor.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: ThemeColor.positive,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  )),
                ],
              )),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 60),
              child: ButtonTheme(
                buttonColor: ThemeColor.positive,
                minWidth: 50,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {},
                  child: Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 70, bottom: 65),
              child: Text(
                "12,000.00",
                style: TextStyle(color: ThemeColor.positive, fontSize: 30),
              )),
        )
      ],
    );
  }
}
