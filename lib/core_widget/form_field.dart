import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/input_field/keyboard_type.dart';
import 'package:desktop/wigget/input_field/validate_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class InputFormField extends StatelessWidget {
  TextEditingController _controller;
  int _validator;
  final Icon _icon;
  final String _name;
  final String _suffixText;
  final int keyboard;
  final bool lastInput;

  InputFormField(this._controller, this._validator, this._icon, this._name,
      this._suffixText, this.keyboard, this.lastInput);

  @override
  Widget build(BuildContext context) {
    dynamic validateType = new ValidateType().checkValidateType(_validator);

    return TextFormField(
        textInputAction:
            lastInput ? TextInputAction.done : TextInputAction.next,
        controller: _controller,
        keyboardType: KeyboardType().checkKeyboard(keyboard),
        obscureText: (keyboard==KeyboardType().password),
        cursorColor: ThemeColor.positive,
        decoration: inputDecoration(_name, _icon, _suffixText),
        validator: (value) {
          if (value.isEmpty) {
            if(_validator==ValidateType().none){
              return null;
            }else{
              return "ต้องการข้อมูลในช่องนี้";
            }
          }else{
           return ValidateType().validatValue(_validator, value);
          }
        });
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

  getbv() {
    return EmailValidator(errorText: "ที่อยู่อีเมลล์ไม่ถูกต้อง");
  }
}
