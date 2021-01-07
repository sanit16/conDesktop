import 'package:desktop/bloc/group_bloc.dart';
import 'package:desktop/data_object/product/productgroup.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';

class CategoryChildList extends StatefulWidget {
  @override
  _CategoryChildListState createState() => _CategoryChildListState();
}

class _CategoryChildListState extends State<CategoryChildList> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      height: 30,
      child: BlocBuilder<GroupBloc,GroupState>(
        builder: (context,state){
          if (state is GroupIsloading) {
            return Center(
              child: CircularProgressIndicator(),
            ) ;
          }  else if(state is GroupIsLoaded){
            return GroupItem(state.group);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            ) ;
          }
        },
      )
    );
  }

}
class GroupItem extends StatefulWidget {
  List<Productgroup> groupList;

  GroupItem(this.groupList);

  @override
  _GroupItemState createState() => _GroupItemState();
}

class _GroupItemState extends State<GroupItem> {
  int stateClick = 0;

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return Container(
      color: ThemeColor.white,
      child:ListView.builder(
      itemCount: widget.groupList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (widget.groupList != null) {
          return Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: OutlineButton(

                onPressed: () => {
                  setClick(index),
                  productBloc.add(FetchProduct(widget.groupList[index].head,widget.groupList[index].name))

                },
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(

                    widget.groupList[index].name,
                    style: TextStyle(
                        fontSize: 16, color:stateClick==index?ThemeColor.negative: ThemeColor.positive),
                    textAlign: TextAlign.center,
                  ),
                ),

                borderSide: BorderSide(color:stateClick==index?ThemeColor.negative: ThemeColor.positive),
                shape: StadiumBorder()
            ),

          );
        } else {
          return Container();
        }

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
