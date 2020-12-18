import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
void LogOut(BuildContext context) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  Alert(
      context: context,
      style: AlertStyle(titleStyle: TextStyle(color: ThemeColor.negative)),
      title: "ยืนยันการออกจากระบบ",

      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text("ยกเลิก",
              style: TextStyle(color: ThemeColor.negative, fontSize: 20)),
          color: ThemeColor.white,
          radius: BorderRadius.circular(15),
        ),
        DialogButton(
          onPressed: () => _prefs.setBool("Loged", false),
          child: Text(
            "ออกจากระบบ",
            style: TextStyle(color: ThemeColor.white, fontSize: 20),
          ),
          color: ThemeColor.negative,
          radius: BorderRadius.circular(15),
        )
      ]).show();
}

InputDecoration inputDecoration(String text) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.negative, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.negative, width: 2),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: ThemeColor.negative, width: 1),
      ),
      labelText: text,
      labelStyle: TextStyle(color: ThemeColor.negative));
}