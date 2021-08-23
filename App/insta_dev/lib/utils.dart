import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var is_visible = false.obs;
  bool vd() {
    // is_visible = b.obs;
    if (is_visible.value == false) {
      is_visible.value = true;
    } else {
      is_visible.value = false;
    }
  }

  var widgets = List<Widget>().obs;
  void add_widget(widgets, widget) {
    widgets.value.add(widget);
  }
}
