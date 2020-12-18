import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkedValue = false;

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('เข้าสู่ระบบ'),
      body: Container(
        child: Row(
          children: [

            Expanded(flex: 1,child: SizedBox(width: 1,),),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
               
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                        "กรอกข้อมูลเพื่อเข้าสู่ระบบ",
                        style:
                            TextStyle(color: ThemeColor.positive, fontSize: 18),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorColor: ThemeColor.positive,
                        obscureText: true,
                        decoration: inputDecoration('อีเมลล์'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorColor: ThemeColor.positive,
                        obscureText: true,
                        decoration: inputDecoration('รหัสผ่าน'),
                      ),
                    ),
                    CheckboxListTile(
                      title: Text(
                        "บันทึกรหัสผ่าน",
                        style:
                            TextStyle(color: ThemeColor.positive, fontSize: 16),
                      ),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),

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
                                    child: Text('ลงทะเบียน',
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
                                  child: Text('เข้าสู่ระบบ',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap:(){
                          print("value");
                        },
                        child:  Text('ลืมรหัสผ่าน ? ',style: TextStyle(color: ThemeColor.positive,fontSize: 16),textAlign: TextAlign.left),
                        // onTap: null,
                        // onHover: (value) {
                        //   isHover = value;
                        //
                        //   setState(() {});
                        // },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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
}
