import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void AddProductDialog(BuildContext context) {
  Alert(
      context: context,
      title: "เพิ่มสินค้า",
      content: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: inputDecoration('ชื่อสินค้า')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(decoration: inputDecoration('ราคาขาย')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: inputDecoration('สต้อก'),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text("ยกเลิก",
              style: TextStyle(color: ThemeColor.positive, fontSize: 20)),
          color: ThemeColor.white,
          radius: BorderRadius.circular(15),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "บันทึก",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: ThemeColor.positive,
          radius: BorderRadius.circular(15),
        )
      ]).show();
}

InputDecoration inputDecoration(String text) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.positive, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.positive, width: 2),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.positive, width: 1),
      ),
      labelText: text,
      labelStyle: TextStyle(color: ThemeColor.positive));
}
