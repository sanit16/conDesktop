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
import 'package:desktop/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_map_location_picker/generated/l10n.dart' as location_picker;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/group_bloc.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLoggedIn = (prefs.getBool('isLoggedIn') == null) ? false : prefs.getBool('isLoggedIn');
  runApp( MyApp(isLoggedIn) );
  // runApp(MyApp());
}

class MyApp extends StatefulWidget {
  bool loggedIn;

  MyApp(this.loggedIn);

  @override
  State<StatefulWidget> createState() {
    return _MainApp(loggedIn);
  }
}

class _MainApp extends State<MyApp> {
  MainProduct mainProduct = new MainProduct();
  bool loggedIn;

  _MainApp(this.loggedIn);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      localizationsDelegates: const [
        location_picker.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
        Locale('es', ''),
        Locale('it', ''),
        Locale('ru', ''),
      ],
      title: "ConstructShop",
      home: Scaffold(
          backgroundColor: Colors.white,
          body: (loggedIn==false)? Login():MainAppBlocProvider()),
    );
  }

}
Future checkAuth( BuildContext context) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  if (_auth.currentUser != null) {
    print("Already singed-in with");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainAppBlocProvider()));
  }
}