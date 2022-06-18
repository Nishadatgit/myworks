import 'package:flutter/material.dart';
import 'package:login_validation/screens/login.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:StudentLogin() ,
    );
  }
}
