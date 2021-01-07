import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("ยืนยันการลบสินค้า",ThemeColor.negative),
      body : Container(

        child: ListView(
          shrinkWrap: true,

          children: [

            Row(
              children: [
                Expanded(
                  child: Column(children: [
                    Image.network("https://firebasestorage.googleapis.com/v0/b/catlog-63873.appspot.com/o/ปูน%2Fปูนซีเมนต์%2F8859088302016.jpg?alt=media&token=bb17fc37ee6eb0e9b1b0b89cf4f58b8d5bb83250",
                      width: 100,
                      height: 100,
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
                        child: Text('ชื่อสินค้า'
                        ),
                      ),
                      Padding(

                        padding: const EdgeInsets.all(8.0),
                        child: Text('ราคาขาย'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('สต้อก'
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
                                color: ThemeColor.negative,
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
