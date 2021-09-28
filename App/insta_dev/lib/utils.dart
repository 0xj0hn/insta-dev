import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  //visible or hide password
  var is_visible = false.obs;
  bool vd() {
    // is_visible = b.obs;
    if (is_visible.value == false) {
      is_visible.value = true;
    } else {
      is_visible.value = false;
    }
  }

  //add widget
  RxList<Widget> widgets = <Widget>[].obs;
}

class RequestFunctions {
  static hashtag_info(username, password, hashtag) async {
    var r = await http.get(
      Uri.parse(
        "http://127.0.0.1:8000/tag/info/$hashtag,$username,$password",
      ),
    );

    return r;
  }

  static likesave(ids, username, password) async {
    var r = await http.get(
      Uri.parse(
        "http://127.0.0.1:8000/posts/likesave/$ids,$username,$password",
      ),
    );

    return r;
  }
}

class ThemeX {
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 14, color: Colors.red),
      ),
      backgroundColor: Colors.black,
      elevation: 5.0,
      centerTitle: true,
    ),
    accentIconTheme: IconThemeData(
      color: Colors.amber,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.amber),
    ),
    primaryColorDark: Colors.black,
    fontFamily: 'Vazir',
    accentTextTheme: TextTheme(bodyText1: TextStyle(fontSize: 14)),
    buttonColor: Colors.amber,
    dividerColor: Colors.grey,
    textTheme: TextTheme(button: TextStyle(fontSize: 14)),
    brightness: Brightness.dark,
    canvasColor: Colors.black,
    accentColor: Colors.amber,
    shadowColor: Colors.grey,
    hoverColor: Colors.grey[800].withOpacity(0.6),
  );
}
