import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  //visible or hide password
  var is_visible = false.obs;
  bool vd() {
    // is_visible = b.obs;
    if (is_visible.value == false) {
      is_visible.value = true;
    } else {
      is_visible.value = false;
    }
  }

  //add widget
  RxList<Widget> widgets = <Widget>[].obs;
  void add_widget(widget) {
    this.widgets.value.add(widget);
  }
}
