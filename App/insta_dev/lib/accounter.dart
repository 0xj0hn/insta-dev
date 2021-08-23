import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils.dart';

//var is_visible = false.obs;

class Accounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ساخت اکانت"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(35),
              child: TextField(
                textDirection: TextDirection.ltr,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "نام کاربری اینستاگرام",
                  hintText: "نام کاربری اینستاگرام اکانت را وارد کنید...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(35),
              child: Obx(
                () => TextField(
                  autocorrect: false,
                  obscureText: c.is_visible.value ? false : true,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    labelText: "گذرواژه اینستاگرام",
                    hintText: "گذرواژه اینستاگرام اکانت را وارد کنید...",
                    border: OutlineInputBorder(),
                    prefix: Obx(
                      () => TextButton(
                        onPressed: () {
                          c.vd();
                        },
                        child: Text(c.is_visible.value ? "پنهان" : "نمایش"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.create),
          tooltip: "اضافه کردن",
          onPressed: () {
            c.add_widget(c.widgets, Text("SSSS"));
          },
        ),
      ),
    );
  }
}
