import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_dev/utils.dart';
import 'accounter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Insta Dev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
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
        title: Obx(
          () => Text("Clicks: ${c.widgets}"),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Obx(
            () => ListView(
              children: c.widgets,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => Accounter());
        },
      ),
    );
  }
}
