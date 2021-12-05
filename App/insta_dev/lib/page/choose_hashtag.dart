import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseHashtagPage extends StatefulWidget {
  @override
  _ChooseHashtagPageState createState() => _ChooseHashtagPageState();
}

class _ChooseHashtagPageState extends State<ChooseHashtagPage> {
  Rx<TextEditingController> hashtagCo = TextEditingController().obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "انتخاب هشتگ",
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.amber),
        ),
        leading: IconButton(
          color: Colors.amber,
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: () {},
        tooltip: "گرفتن اطلاعات هشتگ",
      ),
    );
  }
}
