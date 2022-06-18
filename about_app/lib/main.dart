import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home:  NavigationDrawer(),
    );
  }
}
