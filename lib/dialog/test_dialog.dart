import 'package:desktop/screen/signup_step.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void ShowAlertDialog(BuildContext context) {

  Alert(
      context: context,
      title: "ลงทะเบียน",
      content: SignUpStep(),
      buttons: [
        DialogButton(

          onPressed: () => Navigator.pop(context),
          child: Text(
            "ลงทะเบียน",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        DialogButton(

          onPressed: () => Navigator.pop(context),
          child: Text(
            "ยกเลิก",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        )
      ]).show();
}