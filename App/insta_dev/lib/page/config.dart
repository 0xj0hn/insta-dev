import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ConfigServerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Rx<TextEditingController> IPC = TextEditingController().obs;
    Rx<TextEditingController> PORTC = TextEditingController().obs;
    var choice = 0.obs;
    var host = "".obs;
    host.value = Hive.box("configs").get("url");
    if (host.value == "") {
      Hive.box("configs").put("url", "http://localhost:8000");
    }
    String generateServer(ip, port, protocol) {
      if (port == "") {
      } else {
        port = ":" + port.toString();
      }
      return protocol.toString() + ip.toString() + port.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "پیکربندی سرور",
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
          Obx(
            () => Padding(
              padding: EdgeInsets.all(30),
              child: Text("سرور تنظیم‌شده: " + host.value),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              cursorWidth: 1,
              style: TextStyle(fontSize: 14),
              controller: IPC.value,
              textDirection: TextDirection.ltr,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "آدرس سرور شما",
                hintText: "آی‌پی سرور یا دامنهٔ سرور را وارد کنید",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              cursorWidth: 1,
              style: TextStyle(fontSize: 14),
              controller: PORTC.value,
              textDirection: TextDirection.ltr,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "پورت سرور شما",
                hintText: "پورت سرور را وارد کنید",
                helperMaxLines: 6,
                helperText:
                    "درصورت وارد نکردن پورت، به صورت پیشفرض پورت روی ۸۰ تنظیم می‌شود." +
                        "\n" +
                        "لطفا به صورت لاتین پورت را وارد کنید برای مثال: 8000",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 5),
            child: ListTile(
              title: Text("HTTP"),
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
              title: Text("HTTPS"),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check_rounded),
        onPressed: () {
          var url = generateServer(
            IPC.value.text,
            PORTC.value.text,
            choice.value == 0 ? "http://" : "https://",
          );
          print(generateServer(
            IPC.value.text,
            PORTC.value.text,
            choice.value == 0 ? "http://" : "https://",
          ));
          Hive.box("configs").put("url", url);
          host.value = url;
          Get.snackbar("وضعیت", "آی‌پی سرور بروز شد!");
        },
        tooltip: "ذخیره",
      ),
    );
  }
}
