import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sodaappui/screens/home/soda_home.dart';
import 'package:sodaappui/screens/product_view/product_view_main.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'sodaapp',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          bottomSheetTheme:
            const  BottomSheetThemeData(backgroundColor: Colors.transparent)),
      home: SodaHome(),
    );
  }
}
