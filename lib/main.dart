import 'dart:io';
import 'package:desktop/__main_app_bloc_provider.dart';
import 'package:desktop/bloc/product_bloc.dart';
import 'package:desktop/bucket_list.dart';
import 'package:desktop/category_child_list.dart';
import 'package:desktop/category_list.dart';
import 'package:desktop/data_tool/pathdata.dart';
import 'package:desktop/menu_list.dart';
import 'package:desktop/product_list.dart';
import 'package:desktop/repository/product_repo.dart';
import 'package:desktop/event/main_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/group_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainApp();
  }
}

class _MainApp extends State<MyApp> {
  MainProduct mainProduct = new MainProduct();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ConstructShop",
      home: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: AppBar(
                // Here we create one to set status bar color
                backgroundColor: Colors
                    .black, // Set any color of status bar you want; or it defaults to your theme's primary color
              )),
          backgroundColor: Colors.white,
          body: MainAppBlocProvider()),
    );
  }
}
