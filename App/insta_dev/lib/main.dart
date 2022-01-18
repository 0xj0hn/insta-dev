import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:insta_dev/notification_services.dart';
import 'package:insta_dev/page/choose_hashtag.dart';
import 'package:insta_dev/page/config.dart';
import 'package:insta_dev/utils.dart';
import 'accounter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService().init();

  await Hive.initFlutter();

  await Hive.openBox("accounts");
  await Hive.openBox("configs");
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
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "اینستا دِو",
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.amber),
          ),
          actions: [
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              icon: Icon(
                Icons.more_vert,
                color: Colors.amber,
              ),
              onSelected: (res) {
                if (res == 0) {
                  Get.to(() => ChooseHashtagPage());
                } else if (res == 1) {
                  c.widgets.removeRange(0, c.widgets.length);
                } else if (res == 2) {
                  Get.to(() => ConfigServerPage());
                }
              },
              itemBuilder: (ctx) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "انتخاب هشتگ...",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                      Icon(Icons.check_outlined),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "پاک کردن تمام اکانت‌ها",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.delete),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "پیکربندی سرور",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14),
                      ),
                      Icon(Icons.settings),
                    ],
                  ),
                ),
              ],
            ),
          ]),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Obx(
            () => ListView.builder(
                itemCount: c.widgets.length,
                itemBuilder: (cnx, index) {
                  return c.widgets[index];
                }),
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
      ),
    );
  }
}
