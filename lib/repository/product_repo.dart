import 'package:desktop/constans/strings.dart';
import 'package:desktop/data_object/order/orderproduct.dart';
import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/data_object/product/productgroup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProductRepo{
  Future<List<Product>> getProductList(String head,String group) async{
    final result = await http.Client().get(Strings.product_list+"?head="+head+"&group="+group);
    if (result.statusCode!=200) {
      throw Exception();
    }else{
      return parsedJson(result.body);
    }
  }
  Future<List<Productgroup>> getProductGroup(String head) async{
    print(Strings.productGroup+"?head="+head);
    final result = await http.Client().get(Strings.productGroup+"?head="+head);
    if (result.statusCode!=200) {
      print("error");
      throw Exception();
    }else{
      return parsedGroup(result.body);
    }
  }
  Future<List<OrderProduct>> getProductInBucket(String customer_id) async{
    // print(Strings.productGroup+"?head="+head);
    // final result = await http.Client().get(Strings.productGroup+"?head="+head);
    // if (result.statusCode!=200) {
    //   print("error");
    //   throw Exception();
    // }else{
    //   return parsedGroup(result.body);
    // }
  }
  List<Product> parsedJson(final respons){
     print(respons);
    Iterable list = json.decode(respons);
    List<Product> productList = list.map((model) => Product.fromJson(model)).toList();
    return productList;
  }
  List<Productgroup> parsedGroup(final respons){
     print(respons);
    Iterable list = json.decode(respons);
    List<Productgroup> productList = list.map((model) => Productgroup.fromJson(model)).toList();
    return productList;
  }
}