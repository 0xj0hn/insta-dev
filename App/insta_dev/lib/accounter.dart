import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Accounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
