import 'package:flutter/material.dart';
import 'package:sodaappui/screens/home/soda_home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sodaapp',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        
      ),
      home: const SodaHome() ,
    );
  }
}
