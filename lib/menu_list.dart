import 'package:desktop/dialog/logout.dart';
import 'package:desktop/screen/billing.dart';
import 'package:desktop/screen/delivery.dart';
import 'package:desktop/screen/history.dart';
import 'package:desktop/screen/login.dart';
import 'package:desktop/screen/signup_step.dart';
import 'package:desktop/service/api_manager.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';

import 'dialog/add_product_dialog.dart';
import 'dialog/test_dialog.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonTheme(
                buttonColor: ThemeColor.white,
                minWidth: 60,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: ThemeColor.positive, width: 2)),
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: ThemeColor.positive,
                  ),
                ),
              ),
              ButtonTheme(
                buttonColor: ThemeColor.white,
                minWidth: 60,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: ThemeColor.warning, width: 2)),
                  onPressed: () {},
                  child: Icon(
                    Icons.edit,
                    color: ThemeColor.warning,
                  ),
                ),
              ),
              ButtonTheme(
                buttonColor: ThemeColor.white,
                minWidth: 60,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: ThemeColor.negative, width: 2)),
                  onPressed: () {},
                  child: Icon(
                    Icons.delete,
                    color: ThemeColor.negative,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpStep())),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.storefront,
                          color: ThemeColor.positive,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ข้อมูลร้านค้า",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.positive),
                          ))
                    ],
                  ),
                  highlightedBorderColor: ThemeColor.white,
                  color: ThemeColor.white,
                  borderSide: new BorderSide(color: ThemeColor.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History())),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.assessment,
                          color: ThemeColor.positive,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ประวัติการขาย",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.positive),
                          ))
                    ],
                  ),
                  highlightedBorderColor: ThemeColor.white,
                  color: ThemeColor.white,
                  borderSide: new BorderSide(color: ThemeColor.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Billing())),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.receipt_long,
                          color: ThemeColor.positive,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "การออกบิล",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.positive),
                          ))
                    ],
                  ),
                  highlightedBorderColor: ThemeColor.white,
                  color: ThemeColor.white,
                  borderSide: new BorderSide(color: ThemeColor.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10))),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delivery())),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.local_shipping_rounded,
                          color: ThemeColor.positive,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "การจัดส่ง",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.positive),
                          ))
                    ],
                  ),
                  highlightedBorderColor: ThemeColor.white,
                  color: ThemeColor.white,
                  borderSide: new BorderSide(color: ThemeColor.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10))),
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => LogOut(context),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.logout,
                          color: ThemeColor.positive,
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ออกจากระบบ",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.positive),
                          ))
                    ],
                  ),
                  highlightedBorderColor: ThemeColor.white,
                  color: ThemeColor.white,
                  borderSide: new BorderSide(color: ThemeColor.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10))),
            ),
          ),
        ],
      ),
    );
  }
}
