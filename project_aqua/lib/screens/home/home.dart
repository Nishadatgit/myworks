import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_aqua/constraints.dart';
import 'package:project_aqua/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: myappbar(),
      body: const MyBody(),
    );
  }

  AppBar myappbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      leadingWidth: 35,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/icons/menu.svg'),
      ),
    );
  }
}
