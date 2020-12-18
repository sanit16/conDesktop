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
class GroupItem extends StatelessWidget {
  List<Productgroup> groupList;

  GroupItem(this.groupList);

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return Container(
      color: ThemeColor.white,
      child:ListView.builder(
      itemCount: groupList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (groupList != null) {
          return Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: OutlineButton(
                onPressed: () => {
                  productBloc.add(FetchProduct(groupList[index].head,groupList[index].name))

                },
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    groupList[index].name,
                    style: TextStyle(
                        fontSize: 16, color: ThemeColor.positive),
                    textAlign: TextAlign.center,
                  ),
                ),
                borderSide: BorderSide(color: ThemeColor.positive),
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
}
