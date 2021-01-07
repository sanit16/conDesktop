import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpStep extends StatefulWidget {

  @override
  _SignUpStepState createState() => _SignUpStepState();
}

class _SignUpStepState extends State<SignUpStep> {
  int _currentStep = 0;
  TextEditingController companyName = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  TextEditingController aboutCompany = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController adress = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  TextEditingController distanceDelivery = TextEditingController();
  TextEditingController minPriceDelivery = TextEditingController();
  TextEditingController deliveryRemark = TextEditingController();
  TextEditingController remark = TextEditingController();


  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('ลงทะเบียนใช้งาน',ThemeColor.positive),

      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Theme(
           data: ThemeData(primaryColor: ThemeColor.positive),
          child: Stepper(
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return  Row(
                children: [
                  Expanded(

                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: FlatButton(
                              onPressed: onStepCancel,
                              child: Container(
                                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text('ย้อนกลับ',
                                      style: TextStyle(
                                          fontSize: 18, color: ThemeColor.positive))),
                              textColor: ThemeColor.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ThemeColor.positive,
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: RaisedButton(
                              child: Container(
                                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                                  child: Text('ต่อไป',
                                      style: TextStyle(
                                          fontSize: 18, color: ThemeColor.white))),
                              color: ThemeColor.positive,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30))),
                              onPressed:onStepContinue,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      )),
                  Expanded(
                    child: SizedBox(
                      width: 20,
                    ),
                  ),


                ],
              );
            },
            type: StepperType.horizontal,
            steps: _signUpStep(),
            currentStep: this._currentStep,
            onStepTapped: (step){
              setState(() {
                this._currentStep = step;
              });
            },
            onStepContinue: (){
              setState(()  {
               createUser();
                if (this._currentStep<this._signUpStep().length-1) {
                  this._currentStep = this._currentStep+1;

                }  else{
                  print("Every think is find");
                }
              });

            },
            onStepCancel: (){
              setState(() {
                if (this._currentStep>0) {
                  this._currentStep -=1;

                }else{
                  this._currentStep = 0;
                }
              });
            },
          ),
        ),
      ),
    );
  }
  List<Step> _signUpStep(){
    List<Step> _step = [
      Step(
          title: Text("ข้อมูลบริษัท"),
          content: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        cursorColor: ThemeColor.positive,
                        obscureText: true,
                        decoration: inputDecoration('ชื่อบริษัท'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('หมายเลขผู้เสียภาษี'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('เกี่ยวกับบริษัท'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('เบอร์โทร'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('อีเมลล์'),

                      ),
                    ),
                  ],

                ),

              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('ที่อยู่'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('ตำบล'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('อำเภอ'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('จังหวัด'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('รหัสไปรษณีย์'),

                      ),
                    ),
                  ],
                ),

              )
            ],
          ) ,
          isActive : _currentStep>=0
      ),
      Step(
        title: Text("ข้อมูลการจัดส่ง"),
          content: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('ระยะทางการจัดส่ง'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('ค่าจัดส่งขึ้นต่ำ'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('เงื่อนใขการจัดส่ง'),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('หมายเหตุ'),

                      ),
                    ),
                  ],

                ),

              ),
              Expanded(
                child: Column(
                  children: [

                  ],
                ),

              )
            ],
          ) ,
        isActive : _currentStep>=1
      ),

      Step(
          title: Text("ข้อมูลผู้ใช้งาน"),
          content: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('อีเมลผู้ใช้'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('ชื่อผู้ใช้'),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('รหัสผ่าน'),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: true,
                        decoration: inputDecoration('ยืนยันรหัสผ่าน'),

                      ),
                    ),
                  ],

                ),

              ),
              Expanded(
                child: Column(
                  children: [

                  ],
                ),

              )
            ],
          ) ,
          isActive : _currentStep>=2
      ),

    ];
    return _step;
  }

  InputDecoration inputDecoration(String text) {


    return InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.positive,width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.positive,width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: ThemeColor.positive,width: 1),
                        ),
                        labelText: text,
                          labelStyle: TextStyle(
                              color: ThemeColor.positive
                          )
                      );
  }

  void createUser()  async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "mongmang.vak@gmail.com",
          password: "password"
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
