import 'dart:convert';
import 'package:desktop/bloc/product_bloc.dart';
import 'package:desktop/data_object/product/product.dart';
import 'package:desktop/dialog/edit_product_dialog.dart';
import 'package:desktop/screen/add_product.dart';
import 'package:desktop/screen/delete_product.dart';
import 'package:desktop/screen/edit_product.dart';
import 'package:desktop/service/api_manager.dart';
import 'package:desktop/event/main_product.dart';
import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/product_bloc.dart';
import 'dialog/add_product_dialog.dart';
import 'dialog/delete_product_dialog.dart';
class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  MainProduct mainProduct;

  _ProductListState();

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Container(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductNotSearch) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductIsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductIsLoaded) {
              return ProductItem(state.product);
            } else {
              return Center(
                child: Text("not state"),
              );
            }
          },
        ));
  }

  @override
  void initState() {}
}

class ProductItem extends StatefulWidget {
  List<Product> productList;

  ProductItem(this.productList);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  double elevation = 4.0;

  double scale = 1.0;

  Offset translate = Offset(0, 0);

  @override
  Widget build(context) {
    return InkWell(
      child: FutureBuilder(builder: (context, snapshot) {
        final orientation = MediaQuery.of(context).orientation;

        return Container(
          child: GridView.builder(

              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 3 : 4),
              itemCount: widget.productList.length,
              itemBuilder: (context, index) {
                if (widget.productList.length != 0) {
                  var item = widget.productList[index];
                  return Container(

                    decoration: BoxDecoration(
                        border: Border.all(color:ThemeColor.positive),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        showDialogWithState(context,widget.productList[index]);

                        // Function is executed on tap.
                      },
                      child: Column(
                        children: [
                          AspectRatio(
                              aspectRatio: 5 / 3,
                              child: Image.network(item.image)),

                          FittedBox(

                            child: Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                color: ThemeColor.positive),
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  color: ThemeColor.positive,
                                ),
                                Text(
                                  '${item.price}',
                                  style: TextStyle(
                                      fontSize: 18, color: ThemeColor.positive),
                                ),
                                Icon(
                                  Icons.all_inbox,
                                  color: ThemeColor.positive,
                                ),
                                Text(
                                  '${item.star}',
                                  style: TextStyle(
                                      fontSize: 18, color: ThemeColor.positive),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Text("data");
                }
              }),
        );
      }),
    );
  }

  void showDialogWithState(BuildContext context,Product product) async{


      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String valueCheck = '0';

      valueCheck =prefs.getString('stateClick');
      print(prefs.getString('stateClick'));
      switch(valueCheck){
        case '':
          break;
        case '0':
          break;
        case '1':
        Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductToShop(product)));
          break;
        case '2':
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProductScreen(product)));

          break;
        case '3':
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DeleteProductScreen(product)));

          break;

      }
  }
}
