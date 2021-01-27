import 'package:desktop/core_widget/form_field.dart';
import 'package:desktop/wigget/input_field/validate_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'keyboard_type.dart';

class ProductNameInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  ProductNameInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.workspaces_filled);
  String suffixText = "";
  var name = 'ชื่อสินค้า';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class ProductPriceInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().number;

  ProductPriceInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.money);
  String suffixText = "บาท";
  var name = 'ราคาขาย';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class ProductStockInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().number;

  ProductStockInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.all_inbox_rounded);
  String suffixText = "Ea.";
  var name = 'สต้อก';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class ProductDetailInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  ProductDetailInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.note);
  String suffixText = "";
  var name = 'รายละเอียด';


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}