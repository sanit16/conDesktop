import 'package:desktop/core_widget/form_field.dart';
import 'package:desktop/wigget/input_field/keyboard_type.dart';
import 'package:desktop/wigget/input_field/validate_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class CompanyNameInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;

  CompanyNameInput(this._controller,this.lastInput);
  int validator =  ValidateType().requred;
  var prefixIcon = Icon(Icons.store);
  String suffixText = "";
  var name = 'ชื่อบริษัท';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class TaxNumberInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().number;
  TaxNumberInput(this._controller,this.lastInput);
  int validator = ValidateType().taxNumber;
  var prefixIcon = Icon(Icons.confirmation_number_outlined);
  String suffixText = "";
  var name = 'หมายเลขผู้เสียภาษี';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class AboutCompanyInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().text;
  AboutCompanyInput(this._controller,this.lastInput);
  int validator = ValidateType().none;
  var prefixIcon = Icon(Icons.bookmark);
  String suffixText = "";
  var name = 'เกี่ยวกับบริษัท';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class PhoneInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().phone;
  PhoneInput(this._controller,this.lastInput);
  int validator = ValidateType().phone;
  var prefixIcon = Icon(Icons.phone);
  String suffixText = "";
  var name = 'โทรศัพท์';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}
class EmailInput extends StatelessWidget {
  TextEditingController _controller;
  bool lastInput;
  int keyboard = KeyboardType().email;
  EmailInput(this._controller,this.lastInput);
  int validator =  ValidateType().email;
  var prefixIcon = Icon(Icons.email);
  String suffixText = "";
  var name = 'อีเมลล์';

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputFormField(_controller,validator,prefixIcon,name,suffixText,keyboard,lastInput));
  }
}