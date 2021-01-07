import 'dart:convert';

import 'package:desktop/bloc/group_bloc.dart';
import 'package:desktop/data_object/product/productgroup.dart';
import 'package:desktop/service/api_manager.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Productgroup> _productGroup = new List<Productgroup>();
  List<String> litems = ["1", "2", "Third", "4"];
  int stateClick = 0;

  @override
  void initState() {
    _getGroup();
    // _productGroup = API_Manager.getProductGroup();
  }

  _getGroup() {
    API_Manager.getProductHead().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _productGroup =
            list.map((model) => Productgroup.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<GroupBloc>(context);

    return Container(
      height: 40,
      color: ThemeColor.positive,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: FutureBuilder(
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: _productGroup.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (_productGroup != null) {
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
                          productBloc.add(FetchGroup(_productGroup[index].name))
                        },
                        child: Container(
                          child: Text(
                            _productGroup[index].name,
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
}
