import 'dart:io' as io;
import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:desktop/wigget/input_field/address_input_widget.dart';
import 'package:desktop/wigget/input_field/company_input_widget.dart';
import 'package:desktop/wigget/input_field/delivery_input_widget.dart';
import 'package:desktop/wigget/input_field/input_controller.dart';
import 'package:desktop/wigget/input_field/user_input_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../__main_app_bloc_provider.dart';
class SignUpStep extends StatefulWidget {
  @override
  _SignUpStepState createState() => _SignUpStepState();
}

class _SignUpStepState extends State<SignUpStep> {
  int _currentStep = 0;
  List<String> addressArray;
  String lat;
  String lon;
  CompanyInputController companyController =new CompanyInputController();
  AddressInputController adressController = new AddressInputController();
  DeliveryInputController deliveryController = new DeliveryInputController();
  UserInputController userController = new UserInputController();


  FirebaseAuth auth = FirebaseAuth.instance;
  List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  LocationResult _pickedLocation;
  FirebaseStorage _storage = FirebaseStorage.instance;
  PickedFile image;
  bool saving = false;
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
      appBar: buildAppBar('ลงทะเบียนใช้งาน', ThemeColor.positive),
      body: ModalProgressHUD(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Theme(
            data: ThemeData(primaryColor: ThemeColor.positive),
            child: Stepper(
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: onStepCancel,
                            child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text('ย้อนกลับ',
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
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: RaisedButton(
                            child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text('ต่อไป',
                                    style: TextStyle(
                                        fontSize: 18, color: ThemeColor.white))),
                            color: ThemeColor.positive,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            onPressed: onStepContinue,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    )),

                  ],
                );
              },
              type: StepperType.horizontal,
              steps: _signUpStep(),
              currentStep: this._currentStep,
              // onStepTapped: (step) {
              //   setState(() {
              //     this._currentStep = step;
              //   });
              // },
              onStepContinue: () {
                if (_formKeys[_currentStep].currentState.validate()) {
                  setState(() {
                    // createUser();
                    if (this._currentStep < this._signUpStep().length - 1) {
                      this._currentStep = this._currentStep + 1;
                    } else {
                      createUser(context);
                      // uploadImage();
                    }
                  });
                }
              },
              onStepCancel: () {
                setState(() {
                  if (this._currentStep > 0) {
                    this._currentStep -= 1;
                  } else {
                    this._currentStep = 0;
                  }
                });
              },
            ),
          ),
        ),inAsyncCall:saving ,
      ),
    );
  }

  List<Step> _signUpStep() {
    List<Step> _step = [
      Step(
          title: Text("บริษัท"),
          content: Form(
            key: _formKeys[0],
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getImage(2);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: image == null
                                          ? AssetImage('images/upload.jpg')
                                          : FileImage(io.File(image.path)),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              "เลือกภาพประจำร้าน",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: ThemeColor.positive, fontSize: 16),
                            ),


                          ],
                        ),
                      ),
                      CompanyNameInput(companyController.companyName,false),
                      TaxNumberInput(companyController.taxNumber,false),
                      AboutCompanyInput(companyController.aboutCompany,false),
                      PhoneInput(companyController.phoneNumber,false),
                      EmailInput(companyController.emailAddress,true)
                    ],
                  ),
                ),

              ],
            ),
          ),
          isActive: _currentStep >= 0),
      Step(
          title: Text("ข้อมูลที่อยู่"),
          content: Form(
            key: _formKeys[1],
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                            onPressed: () async {
                              LocationResult result = await showLocationPicker(
                                context,
                                "AIzaSyB6QN-a3s9ZFVW3jDF1mOdI4Vq35dF9wn0",
                                initialCenter: LatLng(14.930217, 101.966514),
                                automaticallyAnimateToCurrentLocation: true,
                                myLocationButtonEnabled: true,
                                layersButtonEnabled: true,
                                countries: ['TH'],
                                language: "TH",

//                      resultCardAlignment: Alignment.bottomCenter,
                                desiredAccuracy: LocationAccuracy.best,
                              );
                              print("result = $result");
                              setState(() {
                                _pickedLocation = result;
                                addressArray =
                                    _pickedLocation.address.split(' ');
                                adressController.address.text = addressArray[0] +
                                    addressArray[1] +
                                    addressArray[2];
                                print("result = $addressArray");

                                adressController.district.text =
                                    addressArray[addressArray.length - 5];
                                adressController.city.text =
                                    addressArray[addressArray.length - 4];
                                adressController.province.text =
                                    addressArray[addressArray.length - 3];
                                adressController.country.text =
                                    addressArray[addressArray.length - 1];
                                adressController.zipcode.text =
                                    addressArray[addressArray.length - 2];
                                lat = result.latLng.latitude.toString();
                                lon = result.latLng.longitude.toString();
                              });
                            },
                            textColor: ThemeColor.positive,
                            borderSide: BorderSide(
                                color: ThemeColor.positive,
                                width: 1.0,
                                style: BorderStyle.solid),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.map_outlined,
                                  color: ThemeColor.positive,
                                ),
                                Text(
                                  'เลือกตำแหน่ง',
                                ),
                                Spacer(),
                                Text(
                                  (_pickedLocation == null)
                                      ? ""
                                      : lat.toString() + "," + lon.toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )),
                      AddressInput(adressController.address, false),
                      DistrictInput(adressController.district, false),
                      CityInput(adressController.city, false),
                      ProvinceInput(adressController.province, false),
                      CountryInput(adressController.country, false),
                      ZipcodeInput(adressController.zipcode, true),
                    ],
                  ),
                )

              ],
            ),
          ),
          isActive: _currentStep >= 1),
      Step(
          title: Text("ข้อมูลการจัดส่ง"),
          content: Form(
            key: _formKeys[2],
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DistanceDeliveryInput(deliveryController.distanceDelivery,false),
                      MinPriceDeliveryInput(deliveryController.minPriceDelivery,false),
                      DeliveryRemarkInput(deliveryController.deliveryRemark,false),
                      RemarkInput(deliveryController.remark,true),
                    ],
                  ),
                ),

              ],
            ),
          ),
          isActive: _currentStep >= 2),
      Step(
          title: Text("ข้อมูลผู้ใช้งาน"),
          content: Form(
            key: _formKeys[3],
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      UserEmailAddressInput(userController.userEmailAddress,false),
                      UserNameInput(userController.userName,false),
                      PasswordInput(userController.password,false),
                      PasswordAgainInput(userController.passwordAgain,true),
                    ],
                  ),
                ),

              ],
            ),
          ),
          isActive: _currentStep >= 3),
    ];
    return _step;
  }

  InputDecoration inputDecoration(
      String text, Icon prefixIcon, String suffixText) {
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

  void createUser(BuildContext buildContext) async {
    setState(() {
      saving =true;
    });
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userController.userEmailAddress.text,
        password: userController.password.text,
      );
      print('create user complete');
      var profileUrl;

        profileUrl = await uploadImage();
        print('complete');

      String user = FirebaseAuth.instance.currentUser.uid;
      String geoKey;
      final firebase = FirebaseDatabase().reference();
      final firestoreInstance = FirebaseFirestore.instance;

      await firebase.child("users").child(user).set(
          {
            "companyName" : companyController.companyName.text,
            "taxNumber" : companyController.taxNumber.text,
            "aboutCompany" : companyController.aboutCompany.text,
            "phoneNumber" : companyController.phoneNumber.text,
            "emailAddress" : companyController.emailAddress.text,
            "imageProfile" : profileUrl,
            "address" : {
              "address" : adressController.address.text,
              "district" : adressController.address.text,
              "city" : adressController.city.text,
              "province" : adressController.province.text,
              "country" : adressController.country.text,
              "zipcode" : adressController.zipcode.text,
            },
            "delivery" : {
              "distanceDelivery" : deliveryController.distanceDelivery.text,
              "minPriceDelivery" : deliveryController.minPriceDelivery.text,
              "deliveryRemark" : deliveryController.deliveryRemark.text,
              "remark" : deliveryController.remark.text,
            },
            "user" : {
              "distanceDelivery" : userController.userEmailAddress.text,
              "minPriceDelivery" : userController.userName.text,
            },
          });
      final geo = Geoflutterfire();
      GeoFirePoint myLocation = geo.point(latitude: _pickedLocation.latLng.latitude, longitude:  _pickedLocation.latLng.longitude);
      firestoreInstance
          .collection('locations')
          .add({'name': user, 'position': myLocation.data});
      // var user = FirebaseAuth.instance.currentUser;
      // user.updateProfile(
      //   displayName: userName.text,
      //   photoURL: "",
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('error');
      print(e);
    }
    setState(() {
      saving =false;
    });
    Navigator.pushReplacement(
        buildContext, MaterialPageRoute(builder: (buildContext) => MainAppBlocProvider()));
  }

  void getImage(int type) async {
    image = await ImagePicker()
        .getImage(
            source: type == 1 ? ImageSource.camera : ImageSource.gallery,
            imageQuality: 50)
        .whenComplete(() {
      setState(() {});
    });
  }
  retriveDta() async{
    final DocumentReference document =   Firestore.instance.collection("listofprods").document('ac1');

    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
      setState(() {
       var data =snapshot.data;
      });
    });
  }
   uploadImage() async {
    var downloadUrl;
    var user = FirebaseAuth.instance.currentUser.uid;
    firebase_storage.UploadTask uploadTask;
    firebase_storage.Reference ref = _storage.ref().child("profile/image/"+user);
    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': image.path});
    if (kIsWeb) {
      uploadTask = ref.putData(await image.readAsBytes(), metadata);
    } else {
      uploadTask =  ref.putFile(io.File(image.path), metadata);
    }

    print('///////////////////////////////////////');
     await ref.getDownloadURL().then((value) => {
      downloadUrl = value
    });
     return downloadUrl;
    // print( await ref.getDownloadURL());
    // print( await uploadTask.snapshot.ref.getDownloadURL());
    // print('///////////////////////////////////////');
    // try {
    //   print("downloadUrl");
    //   print(downloadUrl);
    //   return  downloadUrl;
    //
    // }catch(e){
    //   print("error");
    //   return "";
    // }
  }
}
