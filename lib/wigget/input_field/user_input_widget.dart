import 'package:desktop/core_widget/form_field.dart';
import 'package:desktop/wigget/input_field/validate_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'keyboard_type.dart';

class UserEmailAddressInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().email;

  UserEmailAddressInput(this._controller,this.lastInput);
  int validator =  ValidateType().email;
  var prefixIcon = Icon(Icons.email);
  String suffixText = "";
  var name = 'อีเมลผู้ใช้';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class UserNameInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  UserNameInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.perm_contact_cal);
  String suffixText = "";
  var name = 'ชื่อผู้ใช้';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class PasswordInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().password;

  PasswordInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.verified_user);
  String suffixText = "";
  var name = 'รหัสผ่าน';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class PasswordAgainInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().password;

  PasswordAgainInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.verified_user);
  String suffixText = "";
  var name = 'ยืนยันรหัสผ่าน';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}