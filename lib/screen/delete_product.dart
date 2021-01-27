import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteProductScreen extends StatelessWidget {
  Product product;

  DeleteProductScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("ยืนยันการลบสินค้า",ThemeColor.positive),
      body : Container(

        child: ListView(
          shrinkWrap: true,

          children: [

            Row(
              children: [
                Expanded(
                  child: Column(children: [
                    Image.network(product.image,
                      width: 250,
                      height: 250,
                    ),
                    OutlineButton(
                      onPressed: null,
                      child: Text("เพิ่มรูปภาพ"),

                    ),
                  ],),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(product.name
                        ),
                      ),
                      Padding(

                        padding: const EdgeInsets.all(8.0),
                        child: Text( "ราคา : ${product.price.toString()}"
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("สต้อก : ${product.stock.toString()}"
                        ),
                      ),
                      Padding(

                        padding: const EdgeInsets.all(8.0),
                        child: Text("รายละเอียด : ${product.detail.toString()}"
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: RaisedButton(
                                child: Container(
                                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text('ลบ',
                                        style: TextStyle(
                                            fontSize: 18, color: ThemeColor.white))),
                                color: ThemeColor.positive,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30))),
                                onPressed: () {


                                },

                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
