import 'package:desktop/theme/theme_color.dart';
import 'package:desktop/wigget/appbar_buider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatCustomer extends StatefulWidget {
  @override
  _ChatCustomerState createState() => _ChatCustomerState();
}

class _ChatCustomerState extends State<ChatCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("กล่องข้อความ"),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColor.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                    child:
                    ListView(


                        scrollDirection: Axis.horizontal,
                        children: [
                      SizedBox(width: 10),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: new BoxDecoration(
                              border: Border.all(
                                  color: ThemeColor.negative, width: 3),
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTm7-cf5bt448scpSwxXFGfj85INPzqIgvFZw&usqp=CAU')))),
                      SizedBox(width: 10),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      'https://www.matichon.co.th/wp-content/uploads/2020/08/%E0%B8%84%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%97%E0%B8%B4%E0%B8%9B-1.jpg')))),
                      SizedBox(width: 10),
                      Container(
                          width: 60,
                          height: 60,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      'https://www.prachachat.net/wp-content/uploads/2019/07/timeline_20190704_123238.jpg')))),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              width: 600,
              height: MediaQuery.of(context).size.height-200,
              color: ThemeColor.background,
            )
          ],
        ),
      ),

    );
  }
}
