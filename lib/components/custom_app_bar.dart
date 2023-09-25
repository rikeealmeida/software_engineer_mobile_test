import 'package:flutter/material.dart';

AppBar customAppBar(String title, List<Widget> actions) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 20, height: 30, fontWeight: FontWeight.w600),
    ),
    centerTitle: false,
    actions: actions,
  );
}
