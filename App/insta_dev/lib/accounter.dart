import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_dev/change_information.dart';
import 'utils.dart';

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
                style: TextStyle(fontSize: 14),
                controller: usernameC.value,
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
                  style: TextStyle(fontSize: 14),
                  controller: passwordC.value,
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
            Padding(
              padding: EdgeInsets.all(35),
              child: TextField(
                style: TextStyle(fontSize: 14),
                controller: hashtagCo.value,
                textDirection: TextDirection.ltr,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "هشتگ",
                  hintText: "هشتگ اینستاگرام اکانت را وارد کنید...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
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
                accountName: usernameC.value.text,
                type: choice.value == 1 ? "فالور" : "هشتگ",
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ViewAccount extends StatelessWidget {
  int id;
  String accountName;
  String type;
  ViewAccount({this.id, this.accountName, this.type});

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
                "نام اکانت: " + accountName + "\n" + "نوع: $type",
                textDirection: TextDirection.rtl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_right, color: Colors.limeAccent),
                    tooltip: "اجرای دستور",
                    onPressed: () {},
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
