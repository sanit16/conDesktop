import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop/bloc/group_bloc.dart';
import 'package:desktop/data_object/product/productgroup.dart';
import 'package:desktop/service/api_manager.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';
import 'data_object/product/product.dart';

class Category extends StatefulWidget {
  Set<String> headSet;
  Category(this.headSet);


  @override
  _CategoryState createState() => _CategoryState(headSet);
}

class _CategoryState extends State<Category> {
  int stateClick = 0;
  Set<String> headSet;
  List<String> headList = [];


  _CategoryState(this.headSet);

  @override
  void initState() {
    super.initState();
    if(headSet!=null){
      headSet.forEach((element) {
        headList.add(element);
      });
    }

  }




  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<GroupBloc>(context);
    print("printProductList");
    print(headList);
    return Container(
      height: 40,
      color: ThemeColor.positive,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: FutureBuilder(
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: headList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (headList != null) {
                return Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 1,
                        height: double.infinity,
                        child: const DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.white),
                        ),
                      ),
                      FlatButton(
                        onPressed: () => {
                          setClick(index),
                          productBloc.add(FetchGroup(headList[index]))
                        },
                        child: Container(
                          child: Text(
                            headList[index],
                            style: TextStyle(
                                fontSize: 16, color: ThemeColor.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        color:stateClick==index?ThemeColor.negative: ThemeColor.positive,
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }

  setClick(int index) {
    setState(() {
      stateClick = index;
    });
  }



  // void ownGroup() async{
  //   var user = FirebaseAuth.instance.currentUser.uid;
  //
  //
  //  var ref =    FirebaseFirestore.instance.collection("store");
  //  var hop =  await ref.doc(user).collection('product').snapshots();
  //
  //  print('show');
  //   print( hop.first);
  //
  // }
}
