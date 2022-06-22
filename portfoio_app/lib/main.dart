import 'package:flutter/material.dart';
import 'package:portfoio_app/screens/about_screen.dart';
import 'package:portfoio_app/screens/home_screen.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context),
      routes: {
        'home': (context) => const HomeScreen(),
        'about': (context) => const AboutScreen()
      },
      initialRoute: 'home',
    );
  }
}
