import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:insta_dev/accounter.dart';

class Controller extends GetxController {
  //visible or hide password
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('image');
  static LinuxInitializationSettings linuxInitializationSettings =
      LinuxInitializationSettings(defaultActionName: "Test");
  static final InitializationSettings initializationSettings =
      InitializationSettings(
    android: initializationSettingsAndroid,
  );

  static const androidPlatformChannelSpecifics =
      AndroidNotificationDetails("1", "test");

  static NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
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
  RxList<ViewAccount> widgets = <ViewAccount>[].obs;
  add(addVar) {
    widgets.add(addVar);
  }

  //flutter: [{username: shams, id: 332334729, password: 13821382, type: هشتگ, hashtag: test}]
}

class RequestFunctions {
  static login(username, password) async {
    var hostname = Hive.box("configs").get("url");
    var r = await http.get(
      Uri.parse("$hostname/loader/$username,$password"),
    );
  }

  static hashtag_info(hashtag) async {
    var hostname = Hive.box("configs").get("url");
    var r = await http.get(
      Uri.parse(
        "$hostname/tag/info/$hashtag",
      ),
    );
    print(r.body);
    return r;
  }

  static likesave(ids, username, password) async {
    var hostname = Hive.box("configs").get("url");
    var r = await http.get(
      Uri.parse(
        "$hostname/posts/likesave/$ids,$username,$password",
      ),
    );
    var res = jsonDecode(r.body);
    return res;
  }

  static getFollowings(page, username, password) async {
    var hostname = Hive.box("configs").get("url");
    var url = Uri.parse("$hostname/page/followees/$username,$password,$page");
    var r = await http.get(url);
    var res = jsonDecode(r.body);
    return res;
  }

  static follow(ids, username, password) async {
    var hostname = Hive.box("configs").get("url");
    var url = Uri.parse("$hostname/page/follow/$ids,$username,$password");
    var r = await http.get(url);
    var res = jsonDecode(r.body);
    return res;
  }

  static unfollow(ids, username, password) async {
    var hostname = Hive.box("configs").get("url");
    var url = Uri.parse("$hostname/page/unfollow/$ids,$username,$password");
    var r = await http.get(url);
    var res = jsonDecode(r.body);
    return res;
  }

  static firstPost(page, username, password) async {
    var hostname = Hive.box("configs").get("url");
    var url =
        Uri.parse("$hostname/page/followees/first/$page,$username,$password");
    var r = await http.get(url);
    var res = jsonDecode(r.body);
    return res;
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
      headline6: TextStyle(color: Colors.amber, fontWeight: FontWeight.w300),
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
