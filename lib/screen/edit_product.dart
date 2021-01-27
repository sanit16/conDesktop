import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:desktop/wigget/input_field/input_controller.dart';
import 'package:desktop/wigget/input_field/product_input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatelessWidget {
  ProductInputController controller = new ProductInputController();
  Product product;

  EditProductScreen(this.product);

  @override
  Widget build(BuildContext context) {
    controller.name.text = product.name.toString();
    controller.price.text = product.price.toString();
    controller.stock.text = product.stock.toString();
    controller.description.text = product.description.toString();
    controller.detail.text = product.detail.toString();
    controller.group.text = product.group.toString();
    controller.head.text = product.head.toString();
    controller.image.text = product.image.toString();
    controller.qrcode.text = product.qrcode.toString();
    controller.delivery.text = product.delivery.toString();
    controller.updatedate.text = product.updatedate.toString();
    controller.stock.text = product.stock.toString();
    return Scaffold(
      appBar: buildAppBar("แก้ไขสินค้า", ThemeColor.positive),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.network(
                        product.image,
                        width: 250,
                        height: 250,
                      ),
                      OutlineButton(
                        onPressed: null,
                        child: Text("เพิ่มรูปภาพ"),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      ProductNameInput(controller.name, false),
                      ProductPriceInput(controller.price, false),
                      ProductStockInput(controller.stock, false),
                      ProductDetailInput(controller.detail, true),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: RaisedButton(
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Text('บันทึกการแก้ไข',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeColor.white))),
                                color: ThemeColor.positive,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                onPressed: () {
                                  updateProduct();
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

  void updateProduct() async{
    var user = FirebaseAuth.instance.currentUser.uid;

    final firestoreInstance = FirebaseFirestore.instance;
    Product product = new Product(controller.description.text,
        controller.detail.text,
        controller.group.text,
        controller.head.text,
        controller.image.text,
        controller.name.text,
        double.parse(controller.price.text),
        double.parse(controller.stock.text),
        controller.qrcode.text,
        0.0,
        0.0,
        true,
        DateTime.now());
    // await firestoreInstance.collection(user).where();

  }
}
