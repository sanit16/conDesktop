
import 'package:desktop/data_object/product/product.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
class MainProduct extends ChangeNotifier{
 List<Product> productList = new List();

 MainProduct();
 AddProduct(List<Product> product){
   this.productList = product;
 }
 DecreaseProduct( Product product){

 }
 RemoveProduct(Product product){

 }
}