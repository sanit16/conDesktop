import 'package:form_field_validator/form_field_validator.dart';

class ValidateType{
  int email = 1;
  int requred = 2;
  int phone = 3;
  int taxNumber = 4;
  int none = 5;
  checkValidateType(int key){


  }
  validatValue(int key ,String value ){
    if(key==email){
      final Pattern _emailPattern =
          r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";
      bool checkemail = RegExp(_emailPattern).hasMatch(value);
      if(checkemail){
        print("true");
        return null;
      }else{
        print("false");
        return'ที่อยู่อีเมลล์ไม่ถูกต้อง';

      }
    }
    if(key==requred){
       return null;
    }
    if(key==phone){
      if(value.length<=8){
        return'โปรดกรอกเบอร์โทรให้ครบถ้วน';

      }
      else if(value.length>=12){
        return'โปรดกรอกเบอร์โทรให้ถูกต้อง';
      }else{
        return null;
      }

    }
    if(key==taxNumber){
  if(value.length==13||value.length==10){
    return null;
  }else{
    return'โปรดกรอกเลขผู้เสียภาษีให้ถูกต้อง';

  }
    }
    if(key==none){
      return null;
    }
  }
}