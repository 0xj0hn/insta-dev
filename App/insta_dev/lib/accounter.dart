import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_dev/change_information.dart';
import 'package:insta_dev/notification_services.dart';
import 'utils.dart';
import 'dart:io';
import "package:flutter_local_notifications/flutter_local_notifications.dart";
//var is_visible = false.obs;

class Accounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    final usernameC = TextEditingController().obs;
    final passwordC = TextEditingController().obs;
    final hashtagCo = TextEditingController().obs;
    var choice = 0.obs;
    RxList<String> choices(choice) {
      RxList<String> val = <String>["", ""].obs;
      if (choice == 0) {
        val[0] = "هشتگ";
        val[1] = "هشتگ را وارد کنید.";
      } else if (choice == 1) {
        val[0] = "تگ";
        val[1] = "ايدی اکانت مورد نظر را وارد کنید.";
      } else if (choice == 2) {
        val[0] = "فالوئر";
        val[1] = "اکانت مورد نظر را وارد کنید.";
      } else if (choice == 3) {
        val[0] = "آنفالو";
        val[1] = "اکانت مورد نظر را وارد کنید.";
      }
      return val;
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ساخت اکانت",
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w300),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.amber),
            tooltip: "بازگشت",
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(35),
              child: Obx(
                () => TextField(
                  cursorWidth: 1,
                  style: TextStyle(fontSize: 14),
                  controller: usernameC.value,
                  textDirection: TextDirection.ltr,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: "نام کاربری شما",
                    hintText: "نام کاربری اکانت خود را وارد کنید...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(35),
              child: Obx(
                () => TextField(
                  cursorWidth: 1,
                  style: TextStyle(fontSize: 14),
                  controller: passwordC.value,
                  autocorrect: false,
                  obscureText: c.is_visible.value ? false : true,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    labelText: "گذرواژه شما",
                    hintText: "گذرواژه خود را وارد کنید...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // prefix: Obx(
                    //   () => TextButton(
                    //     onPressed: () {
                    //       c.vd();
                    //     },
                    //     child: Text(c.is_visible.value ? "پنهان" : "نمایش"),
                    //   ),
                    // ),
                    prefixIcon: Obx(
                      () => IconButton(
                          icon: Icon(c.is_visible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            c.vd();
                          },
                          tooltip: c.is_visible.value ? "پنهان" : "نمایش"),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(35),
              child: Obx(
                () => TextField(
                  cursorWidth: 1,
                  style: TextStyle(fontSize: 14),
                  controller: hashtagCo.value,
                  textDirection: TextDirection.ltr,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: choices(choice.value)[0],
                    hintText: choices(choice.value)[1],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
              child: ListTile(
                title: Text("هشتگ"),
                leading: Obx(
                  () => Radio(
                    activeColor: Colors.amber,
                    value: 0,
                    groupValue: choice.value,
                    onChanged: (i) {
                      choice.value = i;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
              child: ListTile(
                title: Text("تگ"),
                leading: Obx(
                  () => Radio(
                    activeColor: Colors.amber,
                    value: 1,
                    groupValue: choice.value,
                    onChanged: (i) {
                      choice.value = i;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: ListTile(
                title: Text("فالوئر"),
                leading: Obx(
                  () => Radio(
                    value: 2,
                    groupValue: choice.value,
                    activeColor: Colors.amber,
                    onChanged: (i) {
                      choice.value = i;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: ListTile(
                title: Text("آنفالو"),
                leading: Obx(
                  () => Radio(
                    value: 3,
                    groupValue: choice.value,
                    activeColor: Colors.amber,
                    onChanged: (i) {
                      choice.value = i;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: ListTile(
                title: Text("آخرین پست"),
                leading: Obx(
                  () => Radio(
                    value: 4,
                    groupValue: choice.value,
                    activeColor: Colors.amber,
                    onChanged: (i) {
                      choice.value = i;
                    },
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
            // c.widgets.add(
            //   ViewAccount(
            //     id: c.widgets.length,
            //     username: usernameC.value.text,
            //     password: passwordC.value.text,
            //     type: choice.value == 1 ? "فالور" : "هشتگ",
            //     hashtag: hashtagCo.value.text,
            //   ),
            // );

            var box = Hive.box("accounts");
            var id = Random.secure().nextInt(1000000000);
            c.add(
              ViewAccount(
                username: usernameC.value.text,
                id: id,
                password: passwordC.value.text,
                type: choice.value != 1 ? 'هشتگ' : 'فالور',
                hashtag: hashtagCo.value.text,
              ),
            );
            //TODO: IM REALLY HERE!

            print(box.get("accounts"));
            Get.back();
            Get.snackbar("وضعیت", "با موفقیت پیج اضافه شد!");
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ViewAccount extends StatelessWidget {
  int id;
  String username;
  String password;
  String type;
  String hashtag;
  ViewAccount({this.id, this.username, this.password, this.type, this.hashtag});

  Controller c = Get.find();
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "نام اکانت: " +
                    username +
                    "\n" +
                    "نوع: $type" +
                    "\n" +
                    "هشتگ: $hashtag",
                textDirection: TextDirection.rtl,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_left_rounded,
                      color: Colors.limeAccent,
                      size: 26,
                    ),
                    tooltip: "اجرای دستور",
                    onPressed: () async {
                      var req;
                      Get.snackbar("وضعیت", "لطفا منتظر بمانید");
                      try {
                        req = await RequestFunctions.hashtag_info(
                          hashtag,
                        );
                      } catch (e) {
                        Get.snackbar("وضعیت", "خطا در برقراری ارتباط با سرور");
                      }

                      if (req.body == "Internal Server Error") {
                        Get.snackbar("وضعیت", "مشکلی پیش آمده است");
                        return -1;
                      }

                      List response = jsonDecode(req.body);

                      Get.defaultDialog(
                        title: "هشتگ $hashtag",
                        middleText:
                            "تعداد پست ها: ${response.length.toString()}\nزمان تقریبی: " +
                                (response.length * 4).toString() +
                                " ثانیه",
                        textConfirm: "شروع!",
                        textCancel: "بیخیال!",
                        onConfirm: () async {
                          String ids = "";
                          for (int i = 0; i < response.length; i++) {
                            if (i == 0) {
                              ids += response[i].toString();
                            } else {
                              ids += "," + response[i].toString();
                            }
                          }

                          print(ids);
                          Get.back();
                          Get.snackbar(
                            "وضعیت",
                            "منتظر بمانید... \n لطفا خارج نشوید.",
                          );

                          final req = await RequestFunctions.likesave(
                            ids,
                            username,
                            password,
                          );
                          var res = jsonDecode(req.body);
                          // const androidPlatformChannelSpecifics =
                          //     AndroidNotificationDetails("1", "test");

                          // const NotificationDetails platformChannelSpecifics =
                          //     NotificationDetails(
                          //         android: androidPlatformChannelSpecifics);

                          // await Controller.flutterLocalNotificationsPlugin.show(
                          //   0,
                          //   'وضعیت',
                          //   'اکانت' + username + " انجام شد.",
                          //   platformChannelSpecifics,
                          //   payload: 'item x',
                          // ); TODO: these lines are for start notification!

                          await NotificationService
                              .flutterLocalNotificationsPlugin
                              .show(
                            0,
                            'وضعیت',
                            "لایک و سیو انجام شد" +
                                "\nلایک شده: ${res[0].length}\n" +
                                "لایک نشده: ${res[1].length}",
                            NotificationDetails(
                              android: NotificationService
                                  .androidPlatformChannelSpecifics,
                            ),
                          );
                        },
                        onCancel: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.edit, color: Colors.teal, size: 16),
                  //   onPressed: () {
                  //     Get.to(
                  //       () => ChangeInformation(
                  //         title: accountName,
                  //         id: id,
                  //       ),
                  //     );
                  //   },
                  //   tooltip: "تغییر اطلاعات اکانت",
                  // ),   TODO: this is not nessecary

                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red, size: 16),
                    onPressed: () {
                      c.widgets.removeWhere((item) => item.id == id);

                      print(id);
                    },
                    tooltip: "حذف اکانت",
                  ),
                ],
              ),
            ],
          )

          //Text('asd\nads\nasd\n'),
          ),
    );
  }
}
