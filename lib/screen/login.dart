import 'package:desktop/screen/signup_step.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../__main_app_bloc_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkedValue = false;

  bool isHover = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    @override
    void initState(){
      super.initState();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    return Scaffold(
      appBar: buildAppBar('เข้าสู่ระบบ',ThemeColor.positive),

      body: Container(
        child: Theme(
          data: ThemeData(primaryColor: ThemeColor.positive),

          child: SingleChildScrollView(
            child: Row(
              children: [

                Expanded(flex: 1,child: SizedBox(width: 1,),),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Form(
                      key: GlobalKey<FormState>(),
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
                            child: TextFormField(
                              controller: emailController,
                              cursorColor: ThemeColor.positive,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                                validator: EmailValidator(
                                    errorText: 'ที่อยู่อีเมลล์ไม่ถูกต้อง'),
                              decoration: inputDecoration('อีเมลล์',Icon(Icons.email),""),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: passwordController,
                              cursorColor: ThemeColor.positive,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              validator: RequiredValidator(
                                  errorText: 'จำเป็นต้องกรอกข้อมูลในช่องนี้'),
                              obscureText: true,
                              decoration: inputDecoration('รหัสผ่าน',Icon(Icons.verified_user),""),
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
                                      onPressed:() => sigup(),
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
                                    onPressed: () {
                                      signIn(context);
                                    },
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
        ),
      ),
    );
  }

  signIn(BuildContext buildContext) async{
    print(emailController.text.trim());
    _auth.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    ).then((user) async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      print("signed in ${emailController.text.trim()}");
      Navigator.pushReplacement(
          buildContext, MaterialPageRoute(builder: (buildContext) => MainAppBlocProvider()));
    }).catchError((error) {
      print(error);
    });
  }

  InputDecoration inputDecoration(String text,Icon prefixIcon,String suffixText) {
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
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        labelStyle: TextStyle(color: ThemeColor.positive));

  }

  sigup() {

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SignUpStep()));
  }
}
