import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 10,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(EvaIcons.heartOutline),
            color: Colors.red,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.blue,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
