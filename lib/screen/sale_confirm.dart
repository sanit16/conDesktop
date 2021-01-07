import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaleConfirm extends StatefulWidget {
  @override
  _SaleConfirmState createState() => _SaleConfirmState();
}

class _SaleConfirmState extends State<SaleConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("ยืนยันการขาย",ThemeColor.positive),
      body: Container(
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: OutlineButton(
                              onPressed: () => {},
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "บิลเงินสด",
                                  style: TextStyle(
                                      fontSize: 16, color: ThemeColor.positive),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              borderSide:
                                  BorderSide(color: ThemeColor.positive),
                              shape: StadiumBorder()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: OutlineButton(
                              onPressed: () => {},
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "ใบกำกับภาษีอย่างย่อ",
                                  style: TextStyle(
                                      fontSize: 16, color: ThemeColor.positive),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              borderSide:
                                  BorderSide(color: ThemeColor.positive),
                              shape: StadiumBorder()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: OutlineButton(
                              onPressed: () => {},
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  "ใบกำกับภาษีเต็มรูปแบบ",
                                  style: TextStyle(
                                      fontSize: 16, color: ThemeColor.positive),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              borderSide:
                                  BorderSide(color: ThemeColor.positive),
                              shape: StadiumBorder()),
                        ),
                      ],
                    ),
                    Text("data")
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(

                        children: [
                          Expanded(
                              child: FlatButton(
                                onPressed: null,
                                child: Container(
                                    margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text('สำเร็จ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: ThemeColor.positive))),
                                textColor: ThemeColor.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: ThemeColor.positive,
                                        width: 2,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(50)),
                              )),

                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: RaisedButton(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Text('พิมพ์',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ThemeColor.white))),
                              color: ThemeColor.positive,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ))
          ],
        ),
      ),
    );
  }
}
