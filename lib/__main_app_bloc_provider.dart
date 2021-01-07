import 'package:desktop/bloc/group_bloc.dart';
import 'package:desktop/bloc/product_bloc.dart';
import 'package:desktop/product_list.dart';
import 'package:desktop/repository/product_repo.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bucket_list.dart';
import 'category_child_list.dart';
import 'category_list.dart';
import 'menu_list.dart';

class MainAppBlocProvider extends StatelessWidget {
  const MainAppBlocProvider({
    Key key,
  }) : super(key: key);


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
                    Category(),
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
}
