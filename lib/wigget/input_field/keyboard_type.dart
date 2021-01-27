import 'package:flutter/cupertino.dart';

class KeyboardType{
  int text = 1;
  int number = 2;
  int email = 3;
  int password = 4;
  int phone = 5;
  checkKeyboard(int key){
    if(key==text){
      return TextInputType.text;
    }
    if(key==number){
      return TextInputType.number;
    }
    if(key==email){
      return TextInputType.emailAddress;
    }
    if(key==password){
      return TextInputType.visiblePassword;
    }
    if(key==phone){
      return TextInputType.phone;
    }
  }
}