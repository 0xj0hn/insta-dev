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
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text("Insta Dev"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Text(
            c.widgets.value.toString(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Accounter(),
          //   ),
          // );
          Get.to(() => Accounter());
        },
        tooltip: "اضافه کردن اکانت",
      ),
    );
  }
}
