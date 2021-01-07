import 'package:desktop/dialog/logout.dart';
import 'package:desktop/screen/billing.dart';
import 'package:desktop/screen/delivery.dart';
import 'package:desktop/screen/history.dart';
import 'package:desktop/screen/login.dart';
import 'package:desktop/screen/signup_step.dart';
import 'package:desktop/service/api_manager.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dialog/add_product_dialog.dart';
import 'dialog/test_dialog.dart';
import 'package:sizer/sizer.dart';

class MenuList extends StatefulWidget {

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  String stateClick = '0';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(

      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                CircleAvatar(
                    backgroundColor: stateClick=='1'?ThemeColor.positive: Colors.white,
                    radius: 30,
                  child: IconButton(
                    onPressed: () {
                      initValue('1');

                    },

                    icon: Icon(
                      Icons.add,
                      color:  stateClick=='1'? Colors.white: ThemeColor.positive,
                      size: 24.0,
                    ),

                  )
                ),
                CircleAvatar(
                    backgroundColor: stateClick=='2'?ThemeColor.warning: Colors.white,
                    radius: 30,

                    child: MaterialButton(
                      onPressed: () {
                        initValue('2');

                      },
                      elevation: 2,
                      textColor: Colors.white,
                      child: Center(
                        child: Icon(
                          Icons.edit,
                          color: stateClick=='2'? Colors.white: ThemeColor.warning,
                          size: 24,
                        ),
                      ),

                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    )
                ),
                CircleAvatar(
                    backgroundColor: stateClick=='3'?ThemeColor.negative: Colors.white,
                    radius: 30,

                    child:  MaterialButton(
                    onPressed: () {
                      initValue('3');

                    },

                    elevation: 2,
                    textColor: Colors.white,
                    child: Icon(
                      Icons.delete,
                      color:stateClick=='3'? Colors.white: ThemeColor.negative,
                      size: 24,
                    ),

                    padding: EdgeInsets.all(16),
                    shape: CircleBorder(),
                  )
                ),

              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          FittedBox(
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpStep()));
                  }

                  ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.storefront,
                        color: ThemeColor.positive,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        "ข้อมูลร้าน",
                        style: TextStyle(
                            fontSize: 18, color: ThemeColor.positive),
                      ),

                    ],
                  ),
                  highlightedBorderColor: ThemeColor.white,
                  color: ThemeColor.white,
                  borderSide: new BorderSide(color: ThemeColor.white),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10))),
            ),
          ),
          FittedBox(
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History())),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.assessment,
                          color: ThemeColor.positive,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ประวัติขาย",
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
          FittedBox(
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Billing())),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.receipt_long,
                          color: ThemeColor.positive,
                        ),
                      ),
                      SizedBox(width: 5,),
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
          FittedBox(
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delivery())),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.local_shipping_rounded,
                          color: ThemeColor.positive,
                        ),
                      ),
                      SizedBox(width: 5,),
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
          FittedBox(
            child: Container(
              height: 35,
              child: OutlineButton(
                  onPressed: () => LogOut(context),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.logout,
                          color: ThemeColor.positive,
                        ),
                      ),
                      SizedBox(width: 5,),
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

  void SiginUp() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth
        .createUserWithEmailAndPassword(email: 'sanit.v@gmail.com', password: 'password1234')
        .then((data) {
      print("Registation Success");
      print(data.user.uid);
      return true;
    }).catchError((e) {
      print("Error: " + e);
      return false;
    });
  }

  void initValue(String s) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    stateClick == s? prefs.setString('stateClick', '0'): prefs.setString('stateClick', s);

    setState(() {

      stateClick==s? stateClick ='0':  stateClick = s;
    });

  }


}
