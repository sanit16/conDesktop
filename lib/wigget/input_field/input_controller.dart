import 'package:flutter/cupertino.dart';

class CompanyInputController {
  TextEditingController companyName = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  TextEditingController aboutCompany = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();

  CompanyInputController();
}

class AddressInputController {
  TextEditingController address = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zipcode = TextEditingController();

  AddressInputController();
}

class DeliveryInputController {
  TextEditingController distanceDelivery = TextEditingController();
  TextEditingController minPriceDelivery = TextEditingController();
  TextEditingController deliveryRemark = TextEditingController();
  TextEditingController remark = TextEditingController();

  DeliveryInputController();
}

class UserInputController {
  TextEditingController userEmailAddress = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordAgain = TextEditingController();

  UserInputController();
}

class ProductInputController {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController group = TextEditingController();
  TextEditingController head = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController qrcode = TextEditingController();
  TextEditingController star = TextEditingController();
  TextEditingController delivery = TextEditingController();
  TextEditingController updatedate = TextEditingController();

  ProductInputController();
}
