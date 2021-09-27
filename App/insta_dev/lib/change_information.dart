// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:insta_dev/utils.dart';
// import 'accounter.dart';

// class ChangeInformation extends StatelessWidget {
//   String title;
//   int id;
//   ChangeInformation({this.title, this.id});
//   @override
//   Controller c = Get.find();
//   final usernameC = TextEditingController().obs;
//   final passwordC = TextEditingController().obs;

//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(35),
//               child: TextField(
//                 controller: usernameC.value,
//                 textDirection: TextDirection.ltr,
//                 autocorrect: false,
//                 decoration: InputDecoration(
//                   labelText: "نام کاربری جدید اینستاگرام",
//                   hintText: "نام کاربری اینستاگرام اکانت را وارد کنید...",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(35),
//               child: Obx(
//                 () => TextField(
//                   controller: passwordC.value,
//                   autocorrect: false,
//                   obscureText: c.is_visible.value ? false : true,
//                   textDirection: TextDirection.ltr,
//                   decoration: InputDecoration(
//                     labelText: "گذرواژه جدید اینستاگرام",
//                     hintText: "گذرواژه اینستاگرام اکانت را وارد کنید...",
//                     border: OutlineInputBorder(),
//                     prefix: Obx(
//                       () => TextButton(
//                         onPressed: () {
//                           c.vd();
//                         },
//                         child: Text(c.is_visible.value ? "پنهان" : "نمایش"),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.create),
//           tooltip: "اضافه کردن",
//           onPressed: () {
//             c.widgets.value[id] = ViewAccount(
//               id: id - 1,
//               username: usernameC.value.text,
//               password: passwordC.value.text,
//               hashtag:  ,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
