import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/bucket_list_state_container.dart';
import 'package:desktop/screen/chat_customer.dart';
import 'package:desktop/screen/sale_confirm.dart';
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
        "image", "name", 15.0, "qrCode", "5", true, "updateDate"));
    bucketList.add(new Product("description", "detail", "group", "head",
        "image", "name2", 10.0, "qrCode", "5", true, "updateDate"));
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: FittedBox(
            child: Column(
              children: [
                Row(children: [
                  CircleAvatar(
                      backgroundColor: ThemeColor.positive,
                      radius: 30,
                      child: IconButton(
                        onPressed: () {


                        },

                        icon: Icon(
                          Icons.add,
                          color:   Colors.white,
                          size: 24.0,
                        ),

                      )
                  ),
                ],),
              ],
            ),
          ),
        ),


        Expanded(    flex: 5,child: BucketListStateContainer(bucketList: bucketList)),


        Expanded(
          flex: 1,
          child: Row(
            children: [
              Text(
                "12,000.00",
                style: TextStyle(color: ThemeColor.positive, fontSize: 30),
              ),
              ButtonTheme(
                buttonColor: ThemeColor.positive,
                minWidth: 50,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatCustomer())),
                  child: Icon(
                    Icons.mail_outline_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
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
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SaleConfirm())),

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
      ],
    );
  }
}
