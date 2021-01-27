import 'package:desktop/core_widget/form_field.dart';
import 'package:desktop/wigget/input_field/validate_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'keyboard_type.dart';

class DistanceDeliveryInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().number;

  DistanceDeliveryInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.track_changes);
  String suffixText = "กิโลเมตร";
  var name = 'ระยะทางการจัดส่ง';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class MinPriceDeliveryInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().number;

  MinPriceDeliveryInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.monetization_on);
  String suffixText = "บาท";
  var name = 'ค่าจัดส่งขึ้นต่ำ';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class DeliveryRemarkInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  DeliveryRemarkInput(this._controller,this.lastInput);
  int validator =  ValidateType().none;
  var prefixIcon = Icon(Icons.note_add_rounded);
  String suffixText = "";
  var name = 'เงื่อนใขการจัดส่ง';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class RemarkInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  RemarkInput(this._controller,this.lastInput);
  int validator =  ValidateType().none;
  var prefixIcon = Icon(Icons.warning);
  String suffixText = "";
  var name = 'หมายเหตุ';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}