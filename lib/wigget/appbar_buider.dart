import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(String title,Color color) {
  return AppBar(
    backgroundColor: color,
    title: Text(title),
    actions: <Widget>[],
  );
}