import 'package:desktop/theme/theme_color.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    backgroundColor: ThemeColor.positive,
    title: Text(title),
    actions: <Widget>[],
  );
}