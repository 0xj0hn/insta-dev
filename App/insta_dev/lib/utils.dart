import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class Controller extends GetxController {
  //visible or hide password
  final mybox = Hive.box("accounts");
  var is_visible = false.obs;
  bool vd() {
    // is_visible = b.obs;
    if (is_visible.value == false) {
      is_visible.value = true;
    } else {
      is_visible.value = false;
    }
  }

  var lst = [].obs;
  var map = {};
  void add_account(String username, String password, String hashtag) {
    //add account to json!
    var id = 0;
    var map = {
      id: {"password": password, "hashtag": hashtag},
    };
    lst.add(map);
    // map.keys.forEach((key) {});
    mybox.put("accounts", json.encode(lst));
    // mybox.remove("accounts");
    print(mybox.get("accounts"));
  }

  //add widget
  RxList<Widget> widgets = <Widget>[].obs;
}

class RequestFunctions {
  static login(username, password) async {
    var r = await http.get(
      Uri.parse("http://localhost:8000/loader/$username,$password"),
    );
  }

  static hashtag_info(hashtag) async {
    var r = await http.get(
      Uri.parse(
        "http://127.0.0.1:8000/tag/info/$hashtag",
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
