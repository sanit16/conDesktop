import 'package:desktop/core_widget/form_field.dart';
import 'package:desktop/wigget/input_field/validate_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'keyboard_type.dart';


class AddressInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  AddressInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.location_searching);
  String suffixText = "";
  var name = 'ที่อยู่';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class DistrictInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  DistrictInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.home);
  String suffixText = "";
  var name = 'ตำบล';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class CityInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  CityInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.home_work);
  String suffixText = "";
  var name = 'อำเภอ';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class ProvinceInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  ProvinceInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.location_city_sharp);
  String suffixText = "";
  var name = 'จังหวัด';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class CountryInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  CountryInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.assistant_photo_sharp);
  String suffixText = "";
  var name = 'ประเทศ';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class ZipcodeInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().number;

  ZipcodeInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.contact_mail);
  String suffixText = "";
  var name = 'รหัสไปรษณีย์';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}