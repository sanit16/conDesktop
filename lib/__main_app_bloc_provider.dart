import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop/bloc/group_bloc.dart';
import 'package:desktop/bloc/product_bloc.dart';
import 'package:desktop/product_list.dart';
import 'package:desktop/repository/product_repo.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bucket_list.dart';
import 'category_child_list.dart';
import 'category_list.dart';
import 'data_object/product/product.dart';
import 'menu_list.dart';

class MainAppBlocProvider extends StatefulWidget {
  const MainAppBlocProvider({
    Key key,
  }) : super(key: key);

  @override
  _MainAppBlocProviderState createState() => _MainAppBlocProviderState();
}

class _MainAppBlocProviderState extends State<MainAppBlocProvider> {
  // List<Product> _productList = new List<Product>();
  List<Product> productList = [];
  var user = FirebaseAuth.instance.currentUser.uid;
  var date = DateTime.now();
  var ref = FirebaseFirestore.instance.collection("store");
  Set<String> headList;
  @override
   initState() async*{
    super.initState();
    // getData();
    await getDataInstore();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    headList = productList.map((e) => e.head).toSet();
    print(headList);
  }

  // void getData() async{
  //   var data = await ref.doc(user).collection('product').get();
  //   data.docs.forEach((element) {
  //     setState(() {
  //       _productList.add(Product.fromJson(element.data()));
  //
  //     });
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "ConstructShop",
      home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBar(
                // Here we create one to set status bar color
                backgroundColor: ThemeColor.positive
                , // Set any color of status bar you want; or it defaults to your theme's primary color
              )),
          backgroundColor: Colors.white,
          body:  BlocProvider(
            create: (context) => GroupBloc(ProductRepo()),
            child: BlocProvider(
              create: (context) => ProductBloc(ProductRepo()),
              child: Padding(
                padding: EdgeInsets.only( bottom: 10),
                child: Column(
                  children: [
                    Category(headList),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: MenuList()),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  CategoryChildList(),
                                  Expanded(child: ProductList()),
                                ],
                              )),
                          Expanded(flex: 2, child: BucketList()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )

      ),
    );




  }

  void getDataInstore() async{

    
    var user = FirebaseAuth.instance.currentUser.uid;
    var date = DateTime.now();
    var ref = FirebaseFirestore.instance.collection("store");
    var data = await ref.doc(user).collection('product').get();
    data.docs.forEach((element) {
      productList.add(Product.fromJson(element.data()));
    });
    productList.forEach((element) {
      print(element.name);
    });

    // await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
    //   setState(() {
    //     data =snapshot.data;
    //   });
    // });
  }



}
