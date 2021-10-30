import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:insta_dev/utils.dart';
import 'accounter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("accounts");
  // await Controller.flutterLocalNotificationsPlugin.initialize(
  //   Controller.initializationSettings,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Insta Dev',
      theme: ThemeX.darkTheme,
      home: Home(),
      locale: Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
          title: Text(
            "InstaDev",
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Obx(
              () => ListView(
                children: c.widgets,
              ),
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 30),
              child: FloatingActionButton(
                child: Icon(Icons.add),
                tooltip: "اضافه کردن اکانت",
                onPressed: () {
                  Get.to(() => Accounter());
                },
              ),
            )
          ],
        ));
  }
}
