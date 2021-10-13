import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_dev/change_information.dart';
import 'utils.dart';
import 'dart:io';
//var is_visible = false.obs;

class Accounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controller c = Get.find();
    final usernameC = TextEditingController().obs;
    final passwordC = TextEditingController().obs;
    final hashtagCo = TextEditingController().obs;
    var choice = 0.obs;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ساخت اکانت"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.amber),
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
              child: TextField(
                cursorWidth: 1,
                style: TextStyle(fontSize: 14),
                controller: usernameC.value,
                textDirection: TextDirection.ltr,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "نام کاربری اینستاگرام",
                  hintText: "نام کاربری اینستاگرام اکانت را وارد کنید...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
                    labelText: "گذرواژه اینستاگرام",
                    hintText: "گذرواژه اینستاگرام اکانت را وارد کنید...",
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
                          icon: Icon(
                              c.is_visible.value ? Icons.shield : Icons.lock),
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
              child: TextField(
                cursorWidth: 1,
                style: TextStyle(fontSize: 14),
                controller: hashtagCo.value,
                textDirection: TextDirection.ltr,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "هشتگ",
                  hintText: "هشتگ اینستاگرام اکانت را وارد کنید...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
              padding: EdgeInsets.only(left: 50, right: 50),
              child: ListTile(
                title: Text("فالور"),
                leading: Obx(
                  () => Radio(
                    value: 1,
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
            print(usernameC.value.text);
            c.widgets.add(
              ViewAccount(
                id: c.widgets.length,
                username: usernameC.value.text,
                password: passwordC.value.text,
                type: choice.value == 1 ? "فالور" : "هشتگ",
                hashtag: hashtagCo.value.text,
              ),
            );
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

                      var response = jsonDecode(req.body);

                      Get.defaultDialog(
                        title: "هشتگ $hashtag",
                        middleText:
                            "تعداد پست ها: ${response["num_results"].toString()}",
                        textConfirm: "شروع!",
                        textCancel: "بیخیال!",
                        onConfirm: () async {
                          String ids = "";
                          print(response);

                          if (response["ranked_items"] == null) {
                            for (int i = 0; i < response["num_results"]; i++) {
                              if (i == 0) {
                                ids += response["items"][i]["id"].toString();
                              } else {
                                ids +=
                                    "," + response["items"][i]["id"].toString();
                              }
                            }
                          } else {
                            for (int i = 0;
                                i < response["ranked_items"].length;
                                i++) {
                              if (i == 0) {
                                ids += response["ranked_items"][i]["id"];
                              } else {
                                ids += "," + response["ranked_items"][i]["id"];
                              }
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

                          Get.snackbar(
                            "وضعیت",
                            "لایک و سیو انجام شد" +
                                "\nلایک شده: ${res[0].length}\n" +
                                "لایک نشده: ${res[1].length}",
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
                      if (c.widgets.length == 1) {
                        c.widgets.removeLast();
                        return 0;
                      }
                      c.widgets.removeAt(id);
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
