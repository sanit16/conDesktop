import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("ตั้งค่าการจัดส่ง",ThemeColor.positive),
      body : Container(
        child: Text("Delivery"),
      ),
    );
  }
}
