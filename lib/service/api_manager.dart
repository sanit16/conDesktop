import 'dart:convert';
import 'dart:io';

import 'package:desktop/constans/strings.dart';
import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/data_object/product/productgroup.dart';
import 'package:desktop/event/main_product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:provider/provider.dart';

class API_Manager {
  void getProduct() async {
    var client = new http.Client();
    var request = new http.Request('POST', Uri.parse(Strings.product_url));
    var body = {
      'content': 'this is a test',
      'name': 'john@doe.com',
      'price': '100',
      'id': '441276300056'
    };
//  request.headers[HttpHeaders.CONTENT_TYPE] = 'application/json; charset=utf-8';
//     request.headers[HttpHeaders.AUTHORIZATION] = 'Basic 021215421fbe4b0d27f:e74b71bbce';
    request.bodyFields = body;
    var future = client
        .send(request)
        .then((response) => response.stream
            .bytesToString()
            .then((value) => print(value.toString())))
        .catchError((error) => print(error.toString()));
  }
  static Future getProductHead() {

    return http.get(Strings.productHead);
  }
  static Future getProductGroup() {

    return http.get(Strings.productGroup);
  }
  static Future<List<dynamic>> fetchUsers() async {

    var result = await http.get(Strings.product_list);
    return json.decode(result.body)['results'];

  }
  static Future getListProduct() {
//     List<Product> list = new List();
//     // MainProduct mainProduct = Provider.of<MainProduct>(context);
//     var client = new http.Client();
//     var request = new http.Request('GET', Uri.parse(Strings.product_list));
//     // var body = {'content':'this is a test', 'name':'john@doe.com', 'price':'100', 'id':'441276300056'};
// //  request.headers[HttpHeaders.CONTENT_TYPE] = 'application/json; charset=utf-8';
// //     request.headers[HttpHeaders.AUTHORIZATION] = 'Basic 021215421fbe4b0d27f:e74b71bbce';
// //     request.bodyFields = body;
//     var future = await client
//         .send(request)
//         .then((response) => response.stream.bytesToString().then((value) {
//               final List t = json.decode(value);
//               t.forEach((element) {
//                 list.add(Product.fromJson(element));
//                 print(element.toString());
//
//               });
//             mainProduct.AddProduct(list);
//
//
//
//             }).catchError((error) {
//               print(error.toString());
//             }));
//     return future;
//   }
    return http.get(Strings.product_list);
  }
}
